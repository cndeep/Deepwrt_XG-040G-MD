#!/bin/bash

# turboacc
curl -sSL https://raw.githubusercontent.com/mufeng05/turboacc/main/add_turboacc.sh -o add_turboacc.sh && bash add_turboacc.sh

# temp
git clone https://github.com/gSpotx2f/luci-app-temp-status package/luci-app-temp-status
git clone https://github.com/gSpotx2f/luci-app-cpu-perf package/luci-app-cpu-perf

# OpenClash
git clone --depth 1 https://github.com/vernesong/OpenClash.git OpenClash

# luci-app-airoha-npu
if [ ! -d "package/luci-app-airoha-npu" ]; then
    git clone https://github.com/rchen14b/luci-app-airoha-npu package/luci-app-airoha-npu
fi

# gecoosac and QModem
git clone --depth=1 https://github.com/laipeng668/luci-app-gecoosac package/luci-app-gecoosac
git clone --depth=1 https://github.com/FUjr/QModem package/QModem

# Modify default IP
sed -i 's/192.168.1.1/192.168.6.1/g' package/base-files/files/bin/config_generate

# Modify version
sed -i 's/ImmortalWrt/DeepWrt/g' package/base-files/image-config.in
sed -i 's/ImmortalWrt/DeepWrt/g' include/version.mk
sed -i 's/ImmortalWrt/DeepWrt/g' package/base-files/files/bin/config_generate

# test for luci-app-airoha-npu
#sed -i '/config BUSYBOX_DEFAULT_DEVMEM/,/default n/ s/default n/default y/' package/utils/busybox/config/default
#echo "CONFIG_DEVMEM=y" >> target/linux/airoha/an7581/config-6.12
