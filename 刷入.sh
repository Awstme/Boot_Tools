#!/system/bin/sh
if [[ ! -e ./ramdisk.cpio ]]; then
echo "ramdisk.cpio文件不存在，请先执行<初始化.sh>脚本"
exit
fi
AWSTME="/data/local/tmp/Awstme"
rm -rf $AWSTME
for i in a b
do
echo "刷入rec至boot_$i"
mkdir $AWSTME
BOOT="/dev/block/by-name/boot_$i"
cp "/data/adb/magisk/magiskboot" "$AWSTME/"
dd if="$BOOT" of="$AWSTME/boot.img"
cd $AWSTME
./magiskboot unpack ./boot.img
cd -
cp "./ramdisk.cpio" "$AWSTME/ramdisk.cpio"
cd $AWSTME
./magiskboot repack ./boot.img
dd if="./new-boot.img" of="$BOOT"
cd -
rm -rf $AWSTME
done
echo "完成"
