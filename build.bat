set SEVENZIP="C:\Program Files\7-Zip\7z.exe"
set foundfile=""
SET var=%cd%
set headeradd=#if _WIN32 #if defined _DLL #pragma comment(lib, "md/ssleay32") #pragma comment(lib, "md/libeay32") #elif defined _MT #pragma comment(lib, "mt/ssleay32") #pragma comment(lib, "mt/libeay32") #endif #endif #ifdef  __cplusplus

for %%g in (*.gz) do set foundfile=%%~ng
set filename=%foundfile:.tar=%
start /wait cmd.exe /k "cleanbuild.bat %filename%"

call %SEVENZIP% e "%var%/%foundfile%.gz"
call %SEVENZIP% x "%var%/%foundfile%"

if exist "C:/Program Files (x86)/Microsoft Visual Studio 12.0/VC/bin/vcvars32.bat" (
	call xcopy "%var%\%filename%" "%var%\openssl-src-win32-VS2013\" /E /H /K /y
	call xcopy "%var%\%filename%" "%var%\openssl-src-win64-VS2013\" /E /H /K /y
	call copy nasm.exe %var%\openssl-src-win32-VS2013\
	start /wait cmd.exe /k "build_each32.bat openssl-src-win32-VS2013 VC-WIN32 "%var%\openssl\lib\native\v120\windesktop\msvcstl\Win32\Release\mt" "/MT" "%var%\openssl\build\native\include\" "12.0""
	start /wait cmd.exe /k "build_each32.bat openssl-src-win32-VS2013 VC-WIN32 "%var%\openssl\lib\native\v120\windesktop\msvcstl\Win32\Release\md" "/MD" "%var%\openssl\build\native\include\" "12.0""
	start /wait cmd.exe /k "build_each32.bat openssl-src-win32-VS2013 debug-VC-WIN32 "%var%\openssl\lib\native\v120\windesktop\msvcstl\Win32\Debug\mt" "/MT" "%var%\openssl\build\native\include\" "12.0""
	start /wait cmd.exe /k "build_each32.bat openssl-src-win32-VS2013 debug-VC-WIN32 "%var%\openssl\lib\native\v120\windesktop\msvcstl\Win32\Debug\md" "/MD" "%var%\openssl\build\native\include\" "12.0""
	
	start /wait cmd.exe /k "build_each64.bat openssl-src-win64-VS2013 VC-WIN64A "%var%\openssl\lib\native\v120\windesktop\msvcstl\x64\Release\mt" "/MT" "%var%\openssl\build\native\include\" "12.0""
	start /wait cmd.exe /k "build_each64.bat openssl-src-win64-VS2013 VC-WIN64A  "%var%\openssl\lib\native\v120\windesktop\msvcstl\x64\Release\md" "/MD" "%var%\openssl\build\native\include\" "12.0""
	start /wait cmd.exe /k "build_each64.bat openssl-src-win64-VS2013 debug-VC-WIN64A  "%var%\openssl\lib\native\v120\windesktop\msvcstl\x64\Debug\mt" "/MT" "%var%\openssl\build\native\include\" "12.0""
	start /wait cmd.exe /k "build_each64.bat openssl-src-win64-VS2013 debug-VC-WIN64A  "%var%\openssl\lib\native\v120\windesktop\msvcstl\x64\Debug\md" "/MD" "%var%\openssl\build\native\include\" "12.0""
	
) 
if exist "C:/Program Files (x86)/Microsoft Visual Studio 14.0/VC/bin/vcvars32.bat" (
	call xcopy "%var%\%filename%" "%var%\openssl-src-win32-VS2015\" /E /H /K /y
	call xcopy "%var%\%filename%" "%var%\openssl-src-win64-VS2015\" /E /H /K /y
	call copy nasm.exe %var%\openssl-src-win32-VS2015\
	
	start /wait cmd.exe /k "build_each32.bat openssl-src-win32-VS2015 VC-WIN32 "%var%\openssl\lib\native\v140\windesktop\msvcstl\Win32\Release\mt" "/MT" "%var%\openssl\build\native\include\" "14.0""
	start /wait cmd.exe /k "build_each32.bat openssl-src-win32-VS2015 VC-WIN32 "%var%\openssl\lib\native\v140\windesktop\msvcstl\Win32\Release\md" "/MD" "%var%\openssl\build\native\include\" "14.0""
	start /wait cmd.exe /k "build_each32.bat openssl-src-win32-VS2015 debug-VC-WIN32 "%var%\openssl\lib\native\v140\windesktop\msvcstl\Win32\Debug\mt" "/MT" "%var%\openssl\build\native\include\" "14.0""
	start /wait cmd.exe /k "build_each32.bat openssl-src-win32-VS2015 debug-VC-WIN32 "%var%\openssl\lib\native\v140\windesktop\msvcstl\Win32\Debug\md" "/MD" "%var%\openssl\build\native\include\" "14.0""
	
	start /wait cmd.exe /k "build_each64.bat openssl-src-win64-VS2015 VC-WIN64A "%var%\openssl\lib\native\v140\windesktop\msvcstl\x64\Release\mt" "/MT" "%var%\openssl\build\native\include\" "14.0""
	start /wait cmd.exe /k "build_each64.bat openssl-src-win64-VS2015 VC-WIN64A  "%var%\openssl\lib\native\v140\windesktop\msvcstl\x64\Release\md" "/MD" "%var%\openssl\build\native\include\" "14.0""
	start /wait cmd.exe /k "build_each64.bat openssl-src-win64-VS2015 debug-VC-WIN64A  "%var%\openssl\lib\native\v140\windesktop\msvcstl\x64\Debug\mt" "/MT" "%var%\openssl\build\native\include\" "14.0""
	start /wait cmd.exe /k "build_each64.bat openssl-src-win64-VS2015 debug-VC-WIN64A  "%var%\openssl\lib\native\v140\windesktop\msvcstl\x64\Debug\md" "/MD" "%var%\openssl\build\native\include\" "14.0""

)
call powershell -Command "(gc %var%\openssl\build\native\include\openssl\opensslconf.h) -replace '#ifdef  __cplusplus', '%headeradd%' | Out-File '%var%\openssl\build\native\include\openssl\opensslconf.h'"

start /wait cmd.exe /k "cleanbuild.bat %filename%"