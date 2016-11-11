call del *.nupkg

copy cryptopp.nuspec cryptopp_nuget\
mkdir cryptopp_nuget\build\native\
copy cryptopp.targets cryptopp_nuget\build\native\

copy cryptopp.v120.nuspec cryptopp_v120_nuget\
mkdir cryptopp_v120_nuget\build\native\
copy cryptopp.v120.targets cryptopp_v120_nuget\build\native\
copy cryptopp.v140.nuspec cryptopp_v140_nuget\
mkdir cryptopp_v140_nuget\build\native\
copy cryptopp.v140.targets cryptopp_v140_nuget\build\native\
copy cryptopp.android.nuspec cryptopp_android_nuget\
mkdir cryptopp_android_nuget\build\native\
copy cryptopp.android.targets cryptopp_android_nuget\build\native\

nuget pack cryptopp_nuget\cryptopp.nuspec
nuget pack cryptopp_v120_nuget\cryptopp.v120.nuspec
nuget pack cryptopp_v140_nuget\cryptopp.v140.nuspec
nuget pack cryptopp_android_nuget\cryptopp.android.nuspec

for /r . %%g in (*.nupkg) do nuget push -Source https://www.nuget.org %%g -Timeout 2147483
call del *.nupkg
