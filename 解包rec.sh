#!/system/bin/sh
TOOL="/data/rec_install_tools"
if [[ ! -f ./recovery.img ]]; then
	echo "未找到recovery.img | Recovery.img not found"
	exit
fi
echo "配置工具 | Configure tools"
rm -rf $TOOL
cp -r ./rec_install_tools $TOOL
cp ./recovery.img $TOOL/rec_tool/twrp.img
chmod -R 777 $TOOL
echo "开始解包 | Start unpacking"
cd $TOOL/rec_tool
./unpack
wait
cd -
cp $TOOL/rec_tool/ramdisk ./rec_install_tools/ramdisk
echo "解包成功 | Unpacked successfully"
echo "清理工具 | Cleaning tools"
rm -rf $TOOL
echo "完成 | Done"
exit