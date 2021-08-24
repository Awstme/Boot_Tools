#!/system/bin/sh
echo "将要刷的rec在MagiskAPP修补了🐴？"
echo "重命名为rec.img并放在此目录了🐴？"
echo "确定是以root的方式执行这个脚本🐴？"
echo "音量键+ 是 音量键- 否"
KEY="$(getevent -qlc 1 | awk '{ print $3 }')"
case "$KEY" in
KEY_VOLUMEUP)
echo "太棒了！咱们继续！"
;;
KEY_VOLUMEDOWN)
echo "不弄好还不快去弄？"
exit
;;
esac
if [[ ! -e ./rec.img ]] then
echo "rec.img文件不存在"
exit
fi
AWSTME="/data/local/tmp/Awstme"
rm -rf $AWSTME
mkdir $AWSTME
cp "/data/adb/magisk/magiskboot" "$AWSTME/"
cp "./rec.img" "$AWSTME/"
cd $AWSTME
./magiskboot unpack ./rec.img
cd -
mv "$AWSTME/ramdisk.cpio" "./ramdisk.cpio"
rm -rf $AWSTME
exit