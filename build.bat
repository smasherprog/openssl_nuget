set SEVENZIP="C:\Program Files\7-Zip\7z.exe"
set foundfile=""
SET var=%cd%

for /r . %%g in (*.gz) do set foundfile=%%~ng
set filename=%foundfile:.tar=%
start /wait cmd.exe /k "cleanbuild.bat %filename%"

call %SEVENZIP% e "%var%/%foundfile%.gz"
call %SEVENZIP% x "%var%/%foundfile%"


call xcopy "%var%\%filename%" "%var%\openssl-src-win32-VS2013\" /E /H /K
call xcopy "%var%\%filename%" "%var%\openssl-src-win64-VS2013\" /E /H /K
call xcopy "%var%\%filename%" "%var%\openssl-src-win32-VS2015\" /E /H /K

start /wait cmd.exe /k "build_each.bat "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\bin\vcvars32.bat" openssl-32 VC-WIN32 "%var%/openssl/lib/native/v120/windesktop/msvcstl/Win32/Debug/mt" "/MT" "%var%/openssl/build/native/include/""
start /wait cmd.exe /k "build_each.bat "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\bin\vcvars32.bat" openssl-32 VC-WIN32 "%var%/openssl/lib/native/v120/windesktop/msvcstl/Win32/Debug/md" "/MD" "%var%/openssl/build/native/include/""

start /wait cmd.exe /k "cleanbuild.bat %filename%"