set /a h=%~1
set /a m=%~2

:hm-out
cls
echo %h%:%m% 自动运行……
for /f "tokens=1-2 delims=: " %%a in ("%time%") do set hm=%%a%%b
if not "%h%%m%"=="%hm%" (
	rem timeout /t 60 /nobreak
	ping -n 60 127.0.0.1>>nul
	goto :hm-out
)
