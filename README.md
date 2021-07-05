shell脚本由<酷安@筱寂XIAOJI>制作

使用说明：  
<刷入ramdiak.sh>刷入ramdisk至boot  
<备份boot.sh>备份boot  
<还原boot.sh>刷入备份的boot  
请确保手机为vab机型，以root方式执行脚本

OTA系统更新说明：  
1.系统更新更新前执行<恢复boot.sh>  
2.到系统更新页面下载OTA更新包更新  
3.等待系统更新校验  
4.先执行<备份boot.sh>后执行<刷入ramdisk.sh>  
5.重启后就会有你刷的rec和Magisk

第一次使用：  
1.请更新完整包  
2.不用执行<恢复boot.sh>  
3.将要刷的rec在Magisk里修补，放在本文件夹，命名为recovery.img，执行<解包rec.sh>
