#!/system/bin/sh
BACKUP="/data/boot_backup"
for i in a b
do
BOOT="/dev/block/by-name/boot_$i"
if [[ ! -b $BOOT ]]; then
	echo "boot_$i镜像不存在"
	exit
fi
echo "开始备份boot_$i镜像"
rm -rf $BACKUP
mkdir $BACKUP
dd if="$BOOT" of="$BACKUP/boot_$i.img"
echo "boot_$i镜像已备份至$BACKUP/boot_$i"
done
exit