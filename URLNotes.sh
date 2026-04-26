#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
$ https://github.com/Jameslau-tech/fanchmwrt
1) kernel patch: target/linux/generic/hack-6.12/950-fwx-nf-conn-struct-user-hook.patch
2) new package：package/fcm
3）new feed
src-git fanchmwrt https://github.com/fanchmwrt/fanchmwrt-packages.git

#src-git OpenWRT_packages https://github.com/ZeroWrt/openwrt_packages.git
节点订阅
https://github.com/beck-8/subs-check
https://github.com/shuaidaoya/FreeNodes

# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
https://github.com/VIKINGYFY/CloseWRT-CI
#https://github.com/bia-pain-bache/BPB-Worker-Panel
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
https://github.com/byJoey/cfnew/tree/main
# https://github.com/SmartRouterZone/CLX-S20P/tree/master
https://github.com/SmartRouterZone/Source
https://github.com/Yuzhii0718
https://github.com/x-wrt
https://github.com/ssnlin
https://github.com/fabricio3g/microbot-claw
https://github.com/lzylipu/openclaw-skill-openwrt-redial
https://github.com/duomi998/luci-app-openclaw-js

# https://github.com/irrocu/openclash
# https://github.com/zuifengguai/OpenClash_Clash
# https://github.com/openclashnode/openclashnode.github.io
# https://github.com/xiaojing110/luci-app-openclaw

# istore
git clone --depth=1 https://github.com/linkease/istore  package/istore
git clone --depth=1 https://github.com/linkease/nas-packages  package/nas
git clone --depth=1 https://github.com/linkease/nas-packages-luci  package/nas-luci

#mediatek
# https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/


# 固件版本名称自定义
#sed -i "s/DISTRIB_DESCRIPTION=.*/DISTRIB_DESCRIPTION='OpenWrt By gino $(date +"%Y%m%d")'/g" package/base-files/files/etc/openwrt_release

# 取消原主题luci-theme-bootstrap 为默认主题
#sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap

# 修改 argon 为默认主题
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# 删除原默认主题
#rm -rf package/lean/luci-theme-bootstrap

# fam app
CONFIG_PACKAGE_fwxd=y
CONFIG_PACKAGE_libfwx_common=y
CONFIG_PACKAGE_kmod-fwx=y
CONFIG_PACKAGE_luci-app-fwx-appfilter=y
CONFIG_PACKAGE_luci-app-fwx-dashboard=y
CONFIG_PACKAGE_luci-app-fwx-dashboard-setting=y
CONFIG_PACKAGE_luci-app-fwx-feature=y
CONFIG_PACKAGE_luci-app-fwx-macfilter=y
#CONFIG_PACKAGE_luci-app-fwx-network=y
CONFIG_PACKAGE_luci-app-fwx-record=y
CONFIG_PACKAGE_luci-app-fwx-resources=y
CONFIG_PACKAGE_luci-app-fwx-session-stat=y
CONFIG_PACKAGE_luci-app-fwx-system=y
CONFIG_PACKAGE_luci-app-fwx-user=y
CONFIG_PACKAGE_luci-app-fwx-user-record=y
CONFIG_PACKAGE_luci-i18n-fwx-appfilter-zh-cn=y
CONFIG_PACKAGE_luci-i18n-fwx-dashboard-setting-zh-cn=y
CONFIG_PACKAGE_luci-i18n-fwx-dashboard-zh-cn=y
CONFIG_PACKAGE_luci-i18n-fwx-feature-zh-cn=y
CONFIG_PACKAGE_luci-i18n-fwx-macfilter-zh-cn=y
#CONFIG_PACKAGE_luci-i18n-fwx-network-zh-cn=y
CONFIG_PACKAGE_luci-i18n-fwx-record-zh-cn=y
CONFIG_PACKAGE_luci-i18n-fwx-session-stat-zh-cn=y
CONFIG_PACKAGE_luci-i18n-fwx-system-zh-cn=y
CONFIG_PACKAGE_luci-i18n-fwx-user-record-zh-cn=y
CONFIG_PACKAGE_luci-i18n-fwx-user-zh-cn=y

