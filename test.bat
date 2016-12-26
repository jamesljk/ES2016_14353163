@echo off
start javaw -jar WordFrequencyStat.jar
if errorlevel 2 (  cls && echo 找不到java虚拟机，下载地址：http://nic.whu.edu.cn/ns/stunet/soft/ && pause  &&  start c:\progra~1\intern~1\iexplore.exe http://nic.whu.edu.cn/ns/stunet/soft/jre.exe  )
exit
@echo on


