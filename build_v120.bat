SET var=%cd%
set filename=%~1

if exist "C:/Program Files (x86)/Microsoft Visual Studio 12.0/VC/bin/vcvars32.bat" (
	call xcopy "%var%\%filename%" "%var%\openssl-src-win32-VS2013\" /E /H /K /y
	call xcopy "%var%\%filename%" "%var%\openssl-src-win64-VS2013\" /E /H /K /y
	call copy nasm.exe %var%\openssl-src-win32-VS2013\
	call copy nasm.exe %var%\openssl-src-win64-VS2013\
	call:build_32 openssl-src-win32-VS2013 VC-WIN32 "%var%\openssl\lib\native\v120\windesktop\msvcstl\Win32\Release\mt" "/MT" "%var%\openssl\build\native\include\"
	call:build_32 openssl-src-win32-VS2013 VC-WIN32 "%var%\openssl\lib\native\v120\windesktop\msvcstl\Win32\Release\md" "/MD" "%var%\openssl\build\native\include\"
	call:build_32 openssl-src-win32-VS2013 debug-VC-WIN32 "%var%\openssl\lib\native\v120\windesktop\msvcstl\Win32\Debug\mt" "/MT" "%var%\openssl\build\native\include\"
	call:build_32 openssl-src-win32-VS2013 debug-VC-WIN32 "%var%\openssl\lib\native\v120\windesktop\msvcstl\Win32\Debug\md" "/MD" "%var%\openssl\build\native\include\" 
	call:build_64 openssl-src-win64-VS2013 VC-WIN64A "%var%\openssl\lib\native\v120\windesktop\msvcstl\x64\Release\mt" "/MT" "%var%\openssl\build\native\include\"
	call:build_64 openssl-src-win64-VS2013 VC-WIN64A "%var%\openssl\lib\native\v120\windesktop\msvcstl\x64\Release\md" "/MD" "%var%\openssl\build\native\include\"
	call:build_64 openssl-src-win64-VS2013 debug-VC-WIN64A "%var%\openssl\lib\native\v120\windesktop\msvcstl\x64\Debug\mt" "/MT" "%var%\openssl\build\native\include\"
	call:build_64 openssl-src-win64-VS2013 debug-VC-WIN64A "%var%\openssl\lib\native\v120\windesktop\msvcstl\x64\Debug\md" "/MD" "%var%\openssl\build\native\include\"
	echo Deleteing win32 folder
	call rd /s /q "%var%\openssl-src-win32-VS2013\"
	echo Deleteing win64 folder
	call rd /s /q "%var%\openssl-src-win64-VS2013\"
) 
exit
goto:eof

:build_32  
SETLOCAL
SET v4=%~3
cd %1
call del /S /q temp32\*
call del /S /q tmp32.dbg\*
call del /S /q out32\*
call del /S /q out32.dbg\*
call "C:/Program Files (x86)/Microsoft Visual Studio 12.0/VC/bin/vcvars32.bat"
call perl Configure %2 --prefix=%3
call ms/do_nasm
call powershell -Command "(gc ms/nt.mak) -replace '/MT', '%4' | Out-File ms/nt.mak -encoding ASCII"
set str1=%2
if not x%str1:debug=%==x%str1% call powershell -Command "(gc ms/nt.mak) -replace 'Zi', 'Z7' | Out-File ms/nt.mak"
call nmake -f ms/nt.mak
call nmake -f ms/nt.mak install
call rd /s /q "%v4%\ssl"
call rd /s /q "%v4%\bin"
call xcopy "%v4%\include" %5 /E /H /K /y
call rd /s /q "%v4%\include"
call move /y "%v4%\lib\*.lib" "%v4%\"
call rd /s /q "%v4%\lib"
cd ..
ENDLOCAL
goto:eof

:build_64
SETLOCAL
SET v4=%~3
cd %1
call del /S /q temp32\*
call del /S /q tmp32.dbg\*
call del /S /q out32\*
call del /S /q out32.dbg\*
call "C:/Program Files (x86)/Microsoft Visual Studio 12.0/VC/bin/amd64/vcvars64.bat"
call perl Configure %2 --prefix=%3
call ms/do_win64a
call powershell -Command "(gc ms/nt.mak) -replace '/MT', '%4' | Out-File ms/nt.mak -encoding ASCII"
set str1=%2
if not x%str1:debug=%==x%str1% call powershell -Command "(gc ms/nt.mak) -replace 'Zi', 'Z7' | Out-File ms/nt.mak"
call nmake -f ms/nt.mak
call nmake -f ms/nt.mak install
call rd /s /q "%v4%\ssl"
call rd /s /q "%v4%\bin"
call xcopy "%v4%\include" %5 /E /H /K /y
call rd /s /q "%v4%\include"
call move /y "%v4%\lib\*.lib" "%v4%\"
call rd /s /q "%v4%\lib"
cd ..
ENDLOCAL
goto:eof