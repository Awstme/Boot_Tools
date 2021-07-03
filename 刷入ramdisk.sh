#!/system/bin/sh

#设置变量
TOOL="/data/rec_install_tools"
BOOT_A="/dev/block/by-name/boot_a"
BOOT_B="/dev/block/by-name/boot_b"
SLOT=`cat /proc/cmdline | tr '[:space:]' '\n' | sed -rn 's/androidboot.slot.{0,7}=//p'`

#检测当前分区
if [[ -n "$SLOT" ]]; then
    echo "当前为$SLOT分区"
    case $SLOT in
        _a)
        BACKUP="/data/boot_backup/boot_a.img" 
        BOOT="/dev/block/by-name/boot_a"
        ;;
        _b)
        BACKUP="/data/boot_backup/boot_b.img" 
        BOOT="/dev/block/by-name/boot_b"
        ;;
    esac
else
    echo "不是vab机型"
    exit
fi

#检测ramdisk文件是否存在
if [ -f "./rec_install_tools/ramdisk/ramdisk" ];then
    echo "ramdisk文件存在，可以刷入"
else 
    echo "ramdisk文件不存在，无法刷入"
    exit
fi

#配置刷入工具
echo "配置刷入工具"
rm -rf $TOOL
cp -r ./rec_install_tools $TOOL
chmod -R 777 $TOOL
cd $TOOL

#刷入ramdisk至boot
echo "刷入ramdisk至boot_a"
dd if="$BOOT_A" of="$TOOL/input/boot.img"
$TOOL/install
wait
dd if="$TOOL/output/new_boot.img" of="$BOOT_A"
echo "刷入ramdisk至boot_b"
dd if="$BOOT_B" of="$TOOL/input/boot.img"
$TOOL/install
wait
dd if="$TOOL/output/new_boot.img" of="$BOOT_B"

#清理刷入工具
echo "清理刷入工具"
rm -rf $TOOL

echo "完成"
exit