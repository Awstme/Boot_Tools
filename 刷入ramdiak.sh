#!/system/bin/sh

# Set variable
TOOL="/data/rec_install_tools"
BOOT_A="/dev/block/by-name/boot_a"
BOOT_B="/dev/block/by-name/boot_b"
SLOT=`cat /proc/cmdline | tr '[:space:]' '\n' | sed -rn 's/androidboot.slot.{0,7}=//p'`

# Check whether it is a virtual A/B device
if [[ -z "$SLOT" ]]; then
	echo "不是vab设备 | Not a virtual A/B device"
	exit
fi

# Check whether the ramdisk file exists
if [[ ! -f "./rec_install_tools/ramdisk/ramdisk" ]]; then
	echo "ramdiak文件不存在 | Ramdisk file does not exist,unable to flash"
	exit
fi

# Configure tools
echo "配置工具 | Configure tools"
rm -rf $TOOL
cp -r ./rec_install_tools $TOOL
chmod -R 777 $TOOL
cd $TOOL

# Flash ramdisk to boot
echo "刷入ramdisk至boot_a | Flash ramdisk to boot_a"
dd if="$BOOT_A" of="$TOOL/input/boot.img"
$TOOL/install
wait
dd if="$TOOL/output/new_boot.img" of="$BOOT_A"
echo "刷入ramdisk至boot_b | Flash ramdisk to boot_b"
dd if="$BOOT_B" of="$TOOL/input/boot.img"
$TOOL/install
wait
dd if="$TOOL/output/new_boot.img" of="$BOOT_B"

# Cleaning tools
echo "清理工具 | Cleaning tools"
rm -rf $TOOL

echo "完成 | Done"
exit