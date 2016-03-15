call del %1.tar
call del *.nupkg
call rd /s /q %1
call rd /s /q "openssl-src-win32-VS2013" 
call rd /s /q "openssl-src-win64-VS2013" 
call rd /s /q "openssl-src-win32-VS2015" 
call rd /s /q "openssl-src-win64-VS2015" 
exit