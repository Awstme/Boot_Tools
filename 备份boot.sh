#!/system/bin/sh
BACKUP="/data/boot_backup"
BOOT_A="/dev/block/by-name/boot_a"
BOOT_B="/dev/block/by-name/boot_b"
if [[ ! -b $BOOT_A || ! -b $BOOT_B ]]; then
	echo "找不到boot_a/b镜像 | Boot_a/b image not found"
	exit
fi
echo "开始备份boot镜像 | Start backup boot images"
rm -rf $BACKUP
mkdir $BACKUP
dd if="$BOOT_A" of="$BACKUP/boot_a.img"
dd if="$BOOT_B" of="$BACKUP/boot_b.img"
echo "原镜像已备份至$BACKUP | The original boot images has been backed up to $BACKUP"
exit