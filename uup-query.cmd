@echo off
setlocal enabledelayedexpansion

title uup镜像查询
cd /d "%~dp0"
set "PATH=%cd%\bin;%PATH%"

set lang=zh-cn

:input_version
set /p build=请输入Windows版本号(例如 26200,19045 等): 
if "%build%"=="" goto input_version

echo.
echo 选择架构
echo ————————————————————————————
echo  1     amd64
echo  2     x86
echo  3     arm64
echo ————————————————————————————
set /p arch=请输入序号选择对应架构: 
if "%arch%"=="1" set arch=amd64
if "%arch%"=="2" set arch=x86
if "%arch%"=="3" set arch=arm64

call info.cmd %build%
call filename.cmd

cls
echo 获取到的信息: 
echo 更新ID：%updateId%
echo 镜像名称：%updateTitle%
echo 镜像版本：%foundBuild%
echo 文件名称：%filename%

echo.
echo 完成
pause
