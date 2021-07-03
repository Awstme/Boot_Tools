#!/system/bin/sh
SLOT=`cat /proc/cmdline | tr '[:space:]' '\n' | sed -rn 's/androidboot.slot.{0,7}=//p'`

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
    echo "不是A/B分区的设备"
    exit
fi

echo "开始恢复boot$SLOT"
dd if=$BACKUP of=$BOOT
echo "恢复完成"
exit