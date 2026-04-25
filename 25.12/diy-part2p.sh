#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

echo "=========================================="
echo "执行自定义优化脚本 (diy-part2.sh)"
echo "=========================================="

# ---------------------------------------------------------
# libxcrypt 专项救治 (极致精简版)
# ---------------------------------------------------------
XCRYPT_MK="feeds/packages/libs/libxcrypt/Makefile"
if [ -f "$XCRYPT_MK" ]; then
    echo ">>> 正在硬化 libxcrypt 编译参数..."
    
    # 1. 强制禁用 werror (兼容多种等号写法)
    # 作用：防止编译器因为一些琐碎的警告而罢工
    sed -i 's/CONFIGURE_ARGS[ \t]*+=[ \t]*/&--disable-werror /' "$XCRYPT_MK"

    # 2. 注入 -fcommon (核心修复)
    # 作用：解决 gen-des-tables.o 报错的真凶（允许多重定义变量）
    # 使用 TARGET_CFLAGS 注入，如果还报 host 错，我们会同时注入给 HOST_CFLAGS
    sed -i 's/TARGET_CFLAGS[ \t]*+=[ \t]*/&-fcommon /' "$XCRYPT_MK"
    
    # 3. 额外保险：针对宿主机编译工具的补丁
    # 因为 gen-des-tables 是在你的电脑上跑的，有时候需要这一行
    # sed -i 's/HOST_CFLAGS[ \t]*+=[ \t]*/&-fcommon /' "$XCRYPT_MK" 2>/dev/null || true

    echo "✅ libxcrypt 参数注入完成。"
fi

#修复Rust编译失败
RUST_FILE=$(find ../feeds/packages/ -maxdepth 3 -type f -wholename "*/rust/Makefile")
if [ -f "$RUST_FILE" ]; then
	echo " "

	sed -i 's/ci-llvm=true/ci-llvm=false/g' $RUST_FILE

	cd $PKG_PATH && echo "rust has been fixed!"
fi

#修改argon主题字体和颜色
if [ -d *"luci-theme-argon"* ]; then
	echo " "

	cd ./luci-theme-argon/

	sed -i "s/primary '.*'/primary '#31a1a1'/; s/'0.2'/'0.5'/; s/'none'/'bing'/; s/'600'/'normal'/" ./luci-app-argon-config/root/etc/config/argon

	cd $PKG_PATH && echo "theme-argon has been fixed!"
fi

# 修改默认 IP (192.168.30.1)
sed -i 's/192.168.1.1/192.168.2.2/g' package/base-files/files/bin/config_generate
#sed -i 's/ImmortalWrt/JWRT/g' package/base-files/files/bin/config_generate
sed -i 's/hostname='.*'/hostname='JWRT'/g' package/base-files/files/bin/config_generate
# change APP Version
# sed -i 's/0.47.075/0.47.088/g' package/feeds/luci/luci-app-openclash/Makefile

echo "✅ SSH2 配置完成。"
