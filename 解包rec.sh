#!/system/bin/sh
TOOL="/data/rec_install_tools"
echo "配置解包工具"
rm -rf $TOOL
cp -r ./rec_install_tools $TOOL
cp ./recovery.img $TOOL/rec_tool/twrp.img
chmod -R 777 $TOOL
echo "开始解包"
cd $TOOL/rec_tool
./unpack
wait
cd -
cp $TOOL/rec_tool/ramdisk ./ramdisk
echo "解包完成"
echo "清理解包工具"
rm -rf $TOOL
echo "清理完成"
echo "完成"
exit