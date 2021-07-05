#!/system/bin/sh
SLOT=`cat /proc/cmdline | tr '[:space:]' '\n' | sed -rn 's/androidboot.slot.{0,7}=//p'`

# Detect current slot
if [[ -n "$SLOT" ]]; then
    echo "当前插槽为 $SLOT | The current slot is $SLOT"
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
    echo "不是vab设备 | Not a virtual A/B device"
    exit
fi

# Detect backup file
if [[ ! -f $BACKUP ]]; then
	echo "未找到备份文件 | Backup file not found"
	exit
fi

# 还原boot
echo "开始还原boot$SLOT | Start restoring boot$SLOT"
dd if=$BACKUP of=$BOOT
echo "还原成功 | Restored successfully"
exit