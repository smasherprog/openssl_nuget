
SET var=%cd%
set msbuild="C:/Program Files (x86)/MSBuild/14.0/Bin/msbuild.exe"
set reponame=Openssl-VS
set dstnuget=openssl_nuget

call rmdir %reponame% /s /q
call rmdir openssl_nuget /s /q
mkdir openssl_nuget\build\native\include

call git clone https://github.com/smasherprog/%reponame%/
cd %reponame%
call git submodule update --init --recursive

call xcopy "%cd%\openssl\include\openssl" "..\openssl_nuget\build\native\include\openssl"  /s /i
call xcopy "%cd%\Config\openssl\opensslconf.h" "..\openssl_nuget\build\native\include\openssl"  /sy

call %msbuild% %reponame%.sln /t:openssl-win32 /p:OutDir=../%dstnuget%/lib/native/v120/windesktop/msvcstl/Win32/Debug/md/ /p:Platform=x86 /p:PlatformToolset=v120 /p:Configuration=Debug_shared /p:RuntimeLibrary=MultiThreadedDebugDLL /p:DebugSymbols=true /p:DebugType=pdbonly
call %msbuild% %reponame%.sln /t:openssl-win32 /p:OutDir=../%dstnuget%/lib/native/v120/windesktop/msvcstl/Win32/Debug/mt/ /p:Platform=x86 /p:PlatformToolset=v120 /p:Configuration=Debug_static /p:RuntimeLibrary=MultiThreadedDebug /p:DebugSymbols=true /p:DebugType=pdbonly
call %msbuild% %reponame%.sln /t:openssl-win32 /p:OutDir=../%dstnuget%/lib/native/v120/windesktop/msvcstl/Win32/Release/md/ /p:Platform=x86 /p:PlatformToolset=v120 /p:Configuration=Release_shared /p:RuntimeLibrary=MultiThreadedDLL /p:DebugSymbols=false /p:DebugType=none
call %msbuild% %reponame%.sln /t:openssl-win32 /p:OutDir=../%dstnuget%/lib/native/v120/windesktop/msvcstl/Win32/Release/mt/ /p:Platform=x86 /p:PlatformToolset=v120 /p:Configuration=Release_static /p:RuntimeLibrary=MultiThreaded /p:DebugSymbols=false /p:DebugType=none

call %msbuild% %reponame%.sln /t:openssl-win64 /p:OutDir=../%dstnuget%/lib/native/v120/windesktop/msvcstl/x64/Debug/md/ /p:Platform=x64 /p:PlatformToolset=v120 /p:Configuration=Debug_shared /p:RuntimeLibrary=MultiThreadedDebugDLL /p:DebugSymbols=true /p:DebugType=pdbonly
call %msbuild% %reponame%.sln /t:openssl-win64 /p:OutDir=../%dstnuget%/lib/native/v120/windesktop/msvcstl/x64/Debug/mt/ /p:Platform=x64 /p:PlatformToolset=v120 /p:Configuration=Debug_static /p:RuntimeLibrary=MultiThreadedDebug /p:DebugSymbols=true /p:DebugType=pdbonly
call %msbuild% %reponame%.sln /t:openssl-win64 /p:OutDir=../%dstnuget%/lib/native/v120/windesktop/msvcstl/x64/Release/md/ /p:Platform=x64 /p:PlatformToolset=v120 /p:Configuration=Release_shared /p:RuntimeLibrary=MultiThreadedDLL /p:DebugSymbols=false /p:DebugType=none
call %msbuild% %reponame%.sln /t:openssl-win64 /p:OutDir=../%dstnuget%/lib/native/v120/windesktop/msvcstl/x64/Release/mt/ /p:Platform=x64 /p:PlatformToolset=v120 /p:Configuration=Release_static /p:RuntimeLibrary=MultiThreaded /p:DebugSymbols=false /p:DebugType=none

call %msbuild% %reponame%.sln /t:openssl-win32 /p:OutDir=../%dstnuget%/lib/native/v140/windesktop/msvcstl/Win32/Debug/md/ /p:Platform=x86 /p:PlatformToolset=v140 /p:Configuration=Debug_shared /p:RuntimeLibrary=MultiThreadedDebugDLL /p:DebugSymbols=true /p:DebugType=pdbonly
call %msbuild% %reponame%.sln /t:openssl-win32 /p:OutDir=../%dstnuget%/lib/native/v140/windesktop/msvcstl/Win32/Debug/mt/ /p:Platform=x86 /p:PlatformToolset=v140 /p:Configuration=Debug_static /p:RuntimeLibrary=MultiThreadedDebug /p:DebugSymbols=true /p:DebugType=pdbonly
call %msbuild% %reponame%.sln /t:openssl-win32 /p:OutDir=../%dstnuget%/lib/native/v140/windesktop/msvcstl/Win32/Release/md/ /p:Platform=x86 /p:PlatformToolset=v140 /p:Configuration=Release_shared /p:RuntimeLibrary=MultiThreadedDLL /p:DebugSymbols=false /p:DebugType=none
call %msbuild% %reponame%.sln /t:openssl-win32 /p:OutDir=../%dstnuget%/lib/native/v140/windesktop/msvcstl/Win32/Release/mt/ /p:Platform=x86 /p:PlatformToolset=v140 /p:Configuration=Release_static /p:RuntimeLibrary=MultiThreaded /p:DebugSymbols=false /p:DebugType=none

call %msbuild% %reponame%.sln /t:openssl-win64 /p:OutDir=../%dstnuget%/lib/native/v140/windesktop/msvcstl/x64/Debug/md/ /p:Platform=x64 /p:PlatformToolset=v140 /p:Configuration=Debug_shared /p:RuntimeLibrary=MultiThreadedDebugDLL /p:DebugSymbols=true /p:DebugType=pdbonly
call %msbuild% %reponame%.sln /t:openssl-win64 /p:OutDir=../%dstnuget%/lib/native/v140/windesktop/msvcstl/x64/Debug/mt/ /p:Platform=x64 /p:PlatformToolset=v140 /p:Configuration=Debug_static /p:RuntimeLibrary=MultiThreadedDebug /p:DebugSymbols=true /p:DebugType=pdbonly
call %msbuild% %reponame%.sln /t:openssl-win64 /p:OutDir=../%dstnuget%/lib/native/v140/windesktop/msvcstl/x64/Release/md/ /p:Platform=x64 /p:PlatformToolset=v140 /p:Configuration=Release_shared /p:RuntimeLibrary=MultiThreadedDLL /p:DebugSymbols=false /p:DebugType=none
call %msbuild% %reponame%.sln /t:openssl-win64 /p:OutDir=../%dstnuget%/lib/native/v140/windesktop/msvcstl/x64/Release/mt/ /p:Platform=x64 /p:PlatformToolset=v140 /p:Configuration=Release_static /p:RuntimeLibrary=MultiThreaded /p:DebugSymbols=false /p:DebugType=none

call %msbuild% %reponame%.sln /t:openssl-arm /p:OutDir=../%dstnuget%\lib\native\android\clang\Debug\armeabi\ /p:Platform=ARM /p:PlatformToolset=Clang_3_8 /p:Configuration=Debug_shared
call %msbuild% %reponame%.sln /t:openssl-arm /p:OutDir=../%dstnuget%\lib\native\android\clang\Debug\armeabi\ /p:Platform=ARM /p:PlatformToolset=Clang_3_8 /p:Configuration=Debug_static
call %msbuild% %reponame%.sln /t:openssl-arm /p:OutDir=../%dstnuget%\lib\native\android\clang\Release\armeabi\ /p:Platform=ARM /p:PlatformToolset=Clang_3_8 /p:Configuration=Release_shared
call %msbuild% %reponame%.sln /t:openssl-arm /p:OutDir=../%dstnuget%\lib\native\android\clang\Release\armeabi\ /p:Platform=ARM /p:PlatformToolset=Clang_3_8 /p:Configuration=Release_static

call %msbuild% %reponame%.sln /t:openssl-arm64 /p:OutDir=../%dstnuget%\lib\native\android\clang\Debug\arm64-v8a\ /p:Platform=ARM64 /p:PlatformToolset=Clang_3_8 /p:Configuration=Debug_shared
call %msbuild% %reponame%.sln /t:openssl-arm64 /p:OutDir=../%dstnuget%\lib\native\android\clang\Debug\arm64-v8a\ /p:Platform=ARM64 /p:PlatformToolset=Clang_3_8 /p:Configuration=Debug_static
call %msbuild% %reponame%.sln /t:openssl-arm64 /p:OutDir=../%dstnuget%\lib\native\android\clang\Release\arm64-v8a\ /p:Platform=ARM64 /p:PlatformToolset=Clang_3_8 /p:Configuration=Release_shared
call %msbuild% %reponame%.sln /t:openssl-arm64 /p:OutDir=../%dstnuget%\lib\native\android\clang\Release\arm64-v8a\ /p:Platform=ARM64 /p:PlatformToolset=Clang_3_8 /p:Configuration=Release_static

call %msbuild% %reponame%.sln /t:openssl-x86 /p:OutDir=../%dstnuget%\lib\native\android\clang\Debug\x86\ /p:Platform=x86 /p:PlatformToolset=Clang_3_8 /p:Configuration=Debug_shared
call %msbuild% %reponame%.sln /t:openssl-x86 /p:OutDir=../%dstnuget%\lib\native\android\clang\Debug\x86\ /p:Platform=x86 /p:PlatformToolset=Clang_3_8 /p:Configuration=Debug_static
call %msbuild% %reponame%.sln /t:openssl-x86 /p:OutDir=../%dstnuget%\lib\native\android\clang\Release\x86\ /p:Platform=x86 /p:PlatformToolset=Clang_3_8 /p:Configuration=Release_shared
call %msbuild% %reponame%.sln /t:openssl-x86 /p:OutDir=../%dstnuget%\lib\native\android\clang\Release\x86\ /p:Platform=x86 /p:PlatformToolset=Clang_3_8 /p:Configuration=Release_static

call %msbuild% %reponame%.sln /t:openssl-x64 /p:OutDir=../%dstnuget%\lib\native\android\clang\Debug\x86_64\ /p:Platform=x64 /p:PlatformToolset=Clang_3_8 /p:Configuration=Debug_shared
call %msbuild% %reponame%.sln /t:openssl-x64 /p:OutDir=../%dstnuget%\lib\native\android\clang\Debug\x86_64\ /p:Platform=x64 /p:PlatformToolset=Clang_3_8 /p:Configuration=Debug_static
call %msbuild% %reponame%.sln /t:openssl-x64 /p:OutDir=../%dstnuget%\lib\native\android\clang\Release\x86_64\ /p:Platform=x64 /p:PlatformToolset=Clang_3_8 /p:Configuration=Release_shared
call %msbuild% %reponame%.sln /t:openssl-x64 /p:OutDir=../%dstnuget%\lib\native\android\clang\Release\x86_64\ /p:Platform=x64 /p:PlatformToolset=Clang_3_8 /p:Configuration=Release_static

cd ..

