set SEVENZIP="C:\Program Files\7-Zip\7z.exe"
set foundfile=""
SET var=%cd%

for %%g in (*.gz) do set foundfile=%%~ng
set filename=%foundfile:.tar=%

call %SEVENZIP% e "%var%/%foundfile%.gz" -aoa
call %SEVENZIP% x "%var%/%foundfile%" -aoa

call del %foundfile%
call del pax_global_header

mkdir openssl_nuget\build\native\include\openssl

cd %filename%
FOR /R %%G in (*.h) DO (
	call copy "%%G" "%var%\openssl_nuget\build\native\include\openssl\" 
)
cd ..

start cmd.exe /k "buildandroid.bat "%filename%""
start cmd.exe /k "build_v120.bat "%filename%""
start cmd.exe /k "build_v140.bat "%filename%""


