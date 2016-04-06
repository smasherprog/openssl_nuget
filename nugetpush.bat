call del *.nupkg
call rename openssl open_ssl
copy opensslconf.h open_ssl\build\native\include\openssl\
copy open_ssl.targets open_ssl\build\native\
copy open_ssl.nuspec open_ssl\
nuget pack open_ssl\open_ssl.nuspec
for /r . %%g in (*.nupkg) do nuget push %%g -Timeout 2147483
