SET v4=%~3
cd %1
call "C:\Program Files (x86)\Microsoft Visual Studio %~6\VC\bin\amd64\vcvars64.bat"

call perl Configure %2 --prefix=%3
call ms/do_win64a
call powershell -Command "(gc ms/nt.mak) -replace '/MT', '%4' | Out-File ms/nt.mak"
call nmake -f ms/nt.mak
call nmake -f ms/nt.mak install

call rd /s /q "%v4%/ssl"
call rd /s /q "%v4%/bin"
call xcopy "%v4%\include" %5 /E /H /K /y
call rd /s /q "%v4%/include"
call move /y "%v4%\lib\*.lib" "%v4%/" 
call rd /s /q "%v4%/lib"
exit

