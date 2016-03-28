call del *.nupkg
call copy opensslconf.h %var%\openssl\build\native\include\openssl\
call rename openssl open_ssl
copy open_ssl.targets open_ssl\build\native\
copy open_ssl.nuspec open_ssl\
nuget pack open_ssl\open_ssl.nuspec
for /r . %%g in (*.nupkg) do nuget push %%g -Timeout 2147483