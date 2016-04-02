set SEVENZIP="C:\Program Files\7-Zip\7z.exe"
set foundfile=""
SET var=%cd%

for %%g in (*.gz) do set foundfile=%%~ng
set filename=%foundfile:.tar=%

call %SEVENZIP% e "%var%/%foundfile%.gz" -aoa
call %SEVENZIP% x "%var%/%foundfile%" -aoa

call del %foundfile%

start cmd.exe /k "buildandroid.bat "%filename%""
start cmd.exe /k "build_v120.bat "%filename%""
start cmd.exe /k "build_v140.bat "%filename%""
