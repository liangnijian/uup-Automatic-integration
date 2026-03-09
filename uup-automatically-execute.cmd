@echo off
echo %time%

rem 移动 ISO
for %%i in (%~dp0uup_file\%filename:~0,-4%\*.iso) do (
	move /y "%%i" "%~dp0%%~nxi"
)
goto :EOF

