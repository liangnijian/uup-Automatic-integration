:readfilename
cls
echo 获取下载文件名
rem timeout /t 5 /nobreak
ping -n 5 127.0.0.1>>nul

set "uupfile=https://uupdump.net/get.php?id=%updateId%&pack=%lang%&edition=professional%%3Bcore&autodl=2"
set filename=
for /f "tokens=4 delims=;= " %%a in ('echo Y ^|powershell -command "Invoke-WebRequest -Uri '%uupfile%'" ^|findstr /i "Content-Disposition:"') do set "filename=%%a"
set "filename=%filename:~1,-1%"
if "%filename%"=="" goto :readfilename
goto :EOF

