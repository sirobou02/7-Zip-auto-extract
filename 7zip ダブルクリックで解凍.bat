setlocal

set file=%~1

cd /d "%~dp1"

set "filename=%~n1"

set "output_folder=%~dp1%filename%"

if not exist "%output_folder%" mkdir "%output_folder%"

start "" /b /wait "C:\Program Files\7-Zip\7z.exe" x "%file%" -o"%output_folder%"

tasklist /fi "imagename eq 7z.exe" | find /i "7z.exe" >nul
if not errorlevel 1 (
	echo �c���Ă��� 7z.exe �������I�����Ă��܂�...
	echo Killing remaining 7z.exe ...
	taskkill /f /im 7z.exe >nul
)

endlocal