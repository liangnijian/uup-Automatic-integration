set position=%~1

:download
cls
echo 正在下载 %filename%
powershell -command "Invoke-WebRequest -Uri '%uupfile%' -OutFile '%position%'"
if not exist "%position%" (
	echo 准备重新下载
	rem timeout /t 5 /nobreak
	ping -n 5 127.0.0.1>>nul
	goto :download
)
goto :EOF

