set build=%~1
set "uupurl=https://api.uupdump.net/listid.php?search=%build%&sortByDate=1"

set condition=
if %build% leq 19045 set "condition=Feature.*build=.*%build%.*%arch%"
if %build% gtr 19045 set "condition=build=.*%build%.*%arch%"

:readID
cls
echo 正在查询 %build% %arch% 的信息……
timeout /t 5 /nobreak

for /f "delims=" %%a in ('powershell -command "Invoke-RestMethod -Uri '%uupurl%' | ConvertTo-Json" ^| findstr /i "%condition%"') do (
	set uuid=%%a
	goto :findinfo
)

:findinfo
set updateTitle=
set foundBuild=
set updateId=
for /f "tokens=2 delims={}" %%b in ("!uuid!") do (
	for /f "tokens=2,4,10 delims=;=" %%c in ("%%b") do (
		set updateTitle=%%c
		set foundBuild=%%d
		set updateId=%%e
	)
)
if "%updateId%"=="" goto :readID
