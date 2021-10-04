# boot_tools
## ![GitHub all releases](https://img.shields.io/github/downloads/Awstme/boot_tools/total?color=%2300FF00)
- `<初始化.sh>`第一次使用时执行
- `<刷入.sh>`刷入ramdisk至boot
- `<备份.sh>`备份boot
- `<还原.sh>`刷入备份的boot
- 请确保手机为vab设备，以root方式执行脚本
## 使用说明
### 第一次使用时
①用MagiskAPP修补要刷的rec镜像  
②将修补后的镜像放在此文件夹  
③执行<初始化.sh>
### OTA系统更新时
①在系统更新前执行<恢复.sh>（第一次不用）  
②到系统更新页面下载OTA更新包更新（第一次请使用完整包）  
③等待系统更新校验  
④先执行<备份.sh>后执行<刷入.sh>  
重启后就会有你刷的rec和Magisk
