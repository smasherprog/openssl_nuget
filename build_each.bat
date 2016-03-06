SET v4=%~4
CALL %1
cd %2

call perl Configure %3 --prefix=%4
call ms/do_nasm
call powershell -Command "(gc ms/nt.mak) -replace '/MT', '%5' | Out-File ms/nt.mak"
call nmake -f ms/nt.mak
call nmake -f ms/nt.mak install

call rd /s /q "%v4%/ssl"
call rd /s /q "%v4%/bin"
call move /y  "%v4%/include/openssl" %6
call rd /s /q "%v4%/include/openssl"
call move /y "%v4%\lib\*.lib" "%v4%/" 
call rd /s /q "%v4%/lib"
exit
