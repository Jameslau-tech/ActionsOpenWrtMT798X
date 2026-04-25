#!/bin/bash
set -e

DAED_VER="1.27.0"

DAED_MK="feeds/packages/net/daed/Makefile"

echo "========================================="
echo " Daed 更新"
echo "========================================="

OLD_VER=$(grep '^PKG_VERSION:=' "$DAED_MK" | cut -d= -f2)

echo "旧版本: ${OLD_VER}"
echo "新版本: ${DAED_VER}"

echo "========================================="

echo ">>> 检查 release 是否存在"

RELEASE_URL="https://github.com/daeuniverse/daed/releases/tag/v${DAED_VER}"

HTTP_CODE=$(curl -sL -o /dev/null -w '%{http_code}' "$RELEASE_URL")

if [ "$HTTP_CODE" != "200" ]; then
    echo "❌ Release 不存在"
    exit 1
fi

echo "✓ Release 存在"

echo ">>> 修改 Makefile 版本"

sed -i "s/^PKG_VERSION:=.*/PKG_VERSION:=${DAED_VER}/" "$DAED_MK"

echo ">>> 下载源码"

TMP_DIR=$(mktemp -d)

SRC_URL="https://codeload.github.com/daeuniverse/daed/tar.gz/refs/tags/v${DAED_VER}"

curl -L -o "$TMP_DIR/daed.tar.gz" "$SRC_URL"

SRC_HASH=$(sha256sum "$TMP_DIR/daed.tar.gz" | awk '{print $1}')

echo "源码 hash:"
echo "$SRC_HASH"

echo ">>> 下载 Web UI"

WEB_URL="https://github.com/daeuniverse/daed/releases/download/v${DAED_VER}/web.zip"

curl -L -o "$TMP_DIR/web.zip" "$WEB_URL"

WEB_HASH=$(sha256sum "$TMP_DIR/web.zip" | awk '{print $1}')

echo "web hash:"
echo "$WEB_HASH"

echo ">>> 写入 Makefile"

sed -i "s/^PKG_MIRROR_HASH:=.*/PKG_MIRROR_HASH:=${SRC_HASH}/" "$DAED_MK"

sed -i "/define Download\/daed-web/,/endef/{s/HASH:=.*/HASH:=${WEB_HASH}/}" "$DAED_MK"

rm -rf "$TMP_DIR"

echo "========================================="
echo "更新完成"
echo "========================================="

grep PKG_VERSION "$DAED_MK"
grep PKG_MIRROR_HASH "$DAED_MK"
grep -A4 "define Download/daed-web" "$DAED_MK" | grep HASH
