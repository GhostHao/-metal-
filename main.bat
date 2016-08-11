@echo off
cls

:menu
echo.
echo.
echo.                        E.解包new.dat
echo.                        0.了解刷入
echo.                        1.检测是否连接你的了手机               
echo.                        2.安装Kingroot和净化大师，按步骤进行卡root（刷了眷恋阳阳的可以跳过）
echo.                        3.准备复制文件
echo.                        4.准备进入刷机界面

set /p choice=

if /i "%choice%"=="0" goto A
if /i "%choice%"=="1" goto S
if /i "%choice%"=="2" goto root
if /i "%choice%"=="3" goto Z
if /i "%choice%"=="4" goto flash
if /i "%choice%"=="E" goto unpack
cls

:unpack
start sdat2img\sdat2img.bat
PAUSE
cls
goto menu

cls
:A
files\learn.txt
cls
goto menu


cls
:S
cls
adb\adb kill-server

adb\adb start-server
adb\adb devices
goto menu

:Z
adb\adb push files\system.img /sdcard/system.img
cls
goto menu

:flash
cls
echo.
echo.
echo.
echo.              7.使用data里的busybox进行刷机（卡root）
echo.              8.直接刷入system（感谢眷恋阳阳的system）  
echo.              9.出错了？怎么办？
           
set /p choice=

if /i "%choice%"=="7" goto E
if /i "%choice%"=="8" goto F
if /i "%choice%"=="9" goto K

:E
cls
adb\adb shell %su %/data/local/tmp/busybox dd if=/sdcard/system.img of=/dev/block/platform/mtk-msdc.0/by-name/system
adb\adb reboot
echo.恭喜完成
PAUSE
exit
:F
cls
adb\adb shell %su %dd if=/sdcard/system.img of=/dev/block/platform/mtk-msdc.0/by-name/system
adb\adb reboot

echo.恭喜完成
PAUSE
exit


:K
files\helper.txt
cls
goto flash

:root
cls
echo.
echo.
echo.          5.安装Kingroot
echo.          6.安装Kingmaster     
 
set /p choice=

if /i "%choice%"=="5" goto T 
if /i "%choice%"=="6" goto U    

:T
cls
adb\adb install tools\Kingroot.apk
cls
goto root

:U
cls
adb\adb install tools\kingmaster.apk
cls
goto menu


