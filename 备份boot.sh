#!/system/bin/sh
BACKUP="/data/boot_backup"
BOOT_A="/dev/block/by-name/boot_a"
BOOT_B="/dev/block/by-name/boot_b"
echo "开始备份原boot镜像"
rm -rf $BACKUP
mkdir $BACKUP
dd if="$BOOT_A" of="$BACKUP/boot_a.img"
dd if="$BOOT_B" of="$BACKUP/boot_b.img"
echo "原boot镜像已备份至$BACKUP"
exit