云编译798x特定机型的精简极速固件 （p3terx 2024新版 基于ubuntu22.04）

路由器型号：

   clx s20l 

说明：
     
     基于immortalwrt的闭源WIFI固件
     默认地址：192.168.2.1 密码：无，直接回车。
- 感谢 https://github.com/yhlh9982/
- H大源码网址: https://github.com/hanwckf/immortalwrt-mt798x
- 237大佬源码网址: https://github.com/padavanonly/immortalwrt-mt798x-24.10
- dailook大佬源码网址: https://github.com/dailook/immortalwrt-mt798x-6.6
- 25.12分支维护大佬chasey-dev网址：https://github.com/chasey-dev/immortalwrt-mt798x-rebase
- 21.02分支的脚本参考和借鉴加菲猫大佬的云编译脚本：https://github.com/lgs2007m/Actions-OpenWrt
- 脚本参考有 七曜大佬 ：https://github.com/VIKINGYFY/CloseWRT-CI
    
注意事项：
     不死u-boot用 H 大的刷，地址：https://github.com/hanwckf/bl-mt798x/releases
     u-boot 刷机方法：https://cmi.hanwckf.top/p/mt798x-uboot-usage
     更新刷写固件时，跨版本更新的，记得不要保存设置，每次更新系统后再按住 rest键8 秒复位一次
     刷写完新固件后，尤其是跨版本更新的，记得先清理浏览器缓存，再访问路由器进行设置。
