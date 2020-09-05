#!/bin/bash
# 本脚本工作目录必须是git仓库的主目录

# Add Some Package

mkdir -p package/custom
cd package/custom
git clone https://github.com/coolsnowwolf/packages
git clone https://github.com/kenzok8/small
git clone https://github.com/gaoadmin/openwrt-packages
git clone https://github.com/openwrt-develop/luci-theme-atmaterial
#git clone https://github.com/vernesong/OpenClash
git clone https://github.com/tty228/luci-app-serverchan
#git clone https://github.com/rufengsuixing/luci-app-adguardhome
git clone -b lede https://github.com/pymumu/luci-app-smartdns
git clone https://github.com/pymumu/openwrt-smartdns
git clone -b 18.06  https://github.com/jerrykuku/luci-theme-argon
rm -rf openwrt-packages/luci-app-jd-dailybonus
git clone https://github.com/jerrykuku/luci-app-jd-dailybonus

cd ../../

# Modify default IP

sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

# Add some default settings

#\cp -rf ../lede/zzz-default-settings package/lean/default-settings/files/zzz-default-settings
curl -fsSL https://raw.githubusercontent.com/gaoadmin/My-action/master/lean-lede/zzz-default-settings > package/lean/default-settings/files/zzz-default-settings
