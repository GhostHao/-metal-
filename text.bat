@echo off
cls

:menu
echo.
echo.
echo.                        E.���new.dat
echo.                        0.�˽�ˢ��
echo.                        1.����Ƿ�����������ֻ�               
echo.                        2.��װKingroot�;�����ʦ����������п�root��ˢ�˾��������Ŀ���������
echo.                        3.׼�������ļ�
echo.                        4.׼������ˢ������

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
echo.              7.ʹ��data���busybox����ˢ������root��
echo.              8.ֱ��ˢ��system����л����������system��  
echo.              9.�����ˣ���ô�죿
           
set /p choice=

if /i "%choice%"=="7" goto E
if /i "%choice%"=="8" goto F
if /i "%choice%"=="9" goto K

:E
cls
adb\adb shell %su %/data/local/tmp/busybox dd if=/sdcard/system.img of=/dev/block/platform/mtk-msdc.0/by-name/system
adb\adb reboot
echo.��ϲ���
PAUSE
exit
:F
cls
adb\adb shell %su %dd if=/sdcard/system.img of=/dev/block/platform/mtk-msdc.0/by-name/system
adb\adb reboot

echo.��ϲ���
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
echo.          5.��װKingroot
echo.          6.��װKingmaster     
 
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


