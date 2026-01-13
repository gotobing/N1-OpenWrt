#!/bin/bash
# ============================================
# OpenWrt 编译前自定义脚本
# 功能：
# 1. 添加第三方插件源码
# 2. 删除 feeds 中的冲突插件
# 3. 修改默认 IP
# 4. 设置 usbmuxd 开机自启
# 5. 修改 LuCI 时间显示格式
# ============================================

# Git 稀疏克隆函数：只克隆指定目录到 package/
function git_sparse_clone() {
  branch="$1"
  repourl="$2"
  shift 2

  git clone --depth=1 -b $branch --single-branch --filter=blob:none --sparse $repourl
  repodir=$(echo $repourl | awk -F '/' '{print $(NF)}')

  cd $repodir && git sparse-checkout set $@
  mv -f $@ ../package
  cd .. && rm -rf $repodir
}

# ================= 添加第三方插件 =================

# PassWall 科学上网（核心包 + LuCI）
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall-packages package/openwrt-passwall-packages
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall package/openwrt-passwall

# Argon 主题及其配置界面（18.06 分支）
git clone -b 18.06 --single-branch --depth 1 https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon
git clone -b 18.06 --single-branch --depth 1 https://github.com/jerrykuku/luci-app-argon-config package/luci-app-argon-config

# Amlogic 设备管理插件
git clone --depth=1 https://github.com/ophub/luci-app-amlogic package/amlogic

# MosDNS（Lua 版本）
git clone -b v5-lua --single-branch --depth 1 https://github.com/sbwml/luci-app-mosdns package/mosdns

# ================= 删除 feeds 中的冲突插件 =================

rm -rf feeds/packages/net/v2ray-geodata
rm -rf feeds/luci/themes/luci-theme-argon
rm -rf feeds/luci/applications/luci-app-argon-config
rm -rf feeds/packages/net/mosdns
rm -rf feeds/packages/utils/v2dat
rm -rf feeds/luci/applications/luci-app-mosdns

# ================= 修改默认配置 =================

# 修改 OpenWrt 默认 LAN IP
sed -i 's/192.168.1.1/192.168.123.1/g' package/base-files/files/bin/config_generate

# 设置 usbmuxd 开机自启（用于 iOS USB 通信）
sed -i '/exit 0/i usbmuxd' package/base-files/files/etc/rc.local

# 修改 LuCI 页面时间显示格式（增加秒和星期）
sed -i 's/os.date()/os.date("%Y-%m-%d %H:%M:%S %A")/g' $(find ./package/*/autocore/files/ -type f -name "index.htm")
