call del *.nupkg

set dstandroidnuget=openssl_android_nuget
mkdir %dstandroidnuget%\build\native
copy open_ssl_android.targets %dstandroidnuget%\build\native\
copy open_ssl_android.nuspec %dstandroidnuget%\
nuget pack %dstandroidnuget%\open_ssl_android.nuspec

set dstwindowsnuget=openssl_windows_nuget
mkdir %dstwindowsnuget%\build\native
copy open_ssl_windows.targets %dstwindowsnuget%\build\native\
copy open_ssl_windows.nuspec %dstwindowsnuget%\
nuget pack %dstwindowsnuget%\open_ssl_windows.nuspec

set dstsnuget=openssl_nuget
mkdir %dstsnuget%\build\native
copy opensslconf.h %dstsnuget%\build\native\include\openssl\
copy open_ssl.targets %dstsnuget%\build\native\
copy open_ssl.nuspec %dstsnuget%\
nuget pack %dstsnuget%\open_ssl.nuspec

for /r . %%g in (*.nupkg) do nuget push %%g -Timeout 2147483
