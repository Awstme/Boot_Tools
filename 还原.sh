#!/system/bin/sh
SLOT=`cat /proc/cmdline | tr '[:space:]' '\n' | sed -rn 's/androidboot.slot.{0,7}=//p'`
if [[ -n "$SLOT" ]]; then
echo "当前为slot$SLOT"
BACKUP="/data/boot_backup/boot$SLOT.img" 
BOOT="/dev/block/by-name/boot$SLOT"
else
echo "不是vab设备"
exit
fi
if [[ ! -f $BACKUP ]]; then
echo "备份文件不存在"
exit
fi
echo "还原boot$SLOT"
dd if=$BACKUP of=$BOOT
echo "完成"
exit
