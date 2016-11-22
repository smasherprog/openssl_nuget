call del *.nupkg

set basereponame=openssl

copy %basereponame%.nuspec %basereponame%_nuget\
mkdir %basereponame%_nuget\build\native\
copy %basereponame%.targets %basereponame%_nuget\build\native\

copy %basereponame%.v120.nuspec %basereponame%_v120_nuget\
mkdir %basereponame%_v120_nuget\build\native\
copy %basereponame%.v120.targets %basereponame%_v120_nuget\build\native\
copy %basereponame%.v140.nuspec %basereponame%_v140_nuget\
mkdir %basereponame%_v140_nuget\build\native\
copy %basereponame%.v140.targets %basereponame%_v140_nuget\build\native\
copy %basereponame%.android.nuspec %basereponame%_android_nuget\
mkdir %basereponame%_android_nuget\build\native\
copy %basereponame%.android.targets %basereponame%_android_nuget\build\native\

nuget pack %basereponame%_nuget\%basereponame%.nuspec
nuget pack %basereponame%_v120_nuget\%basereponame%.v120.nuspec
nuget pack %basereponame%_v140_nuget\%basereponame%.v140.nuspec
nuget pack %basereponame%_android_nuget\%basereponame%.android.nuspec

for /r . %%g in (*.nupkg) do nuget push -Source https://www.nuget.org %%g -Timeout 2147483
call del *.nupkg
