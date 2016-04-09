SET var=%cd%
SET dst_src=openssl-android-src
set filename=%~1

call xcopy "%var%\%filename%" "%var%\%dst_src%\" /E /H /K /y

copy Android.mk %dst_src%\
copy android-config.mk %dst_src%\
copy build-config.mk %dst_src%\
copy Crypto.mk %dst_src%\
copy Ssl.mk %dst_src%\
copy Android_Build_Assembly.bat %dst_src%\
copy AndroidManifest.xml %dst_src%\

mkdir %dst_src%\jni
mkdir %dst_src%\include\openssl
copy Application.mk %dst_src%\jni\
cd %dst_src%

FOR /R %%G in (*.h) DO (
	call copy "%%G" "%cd%\include\openssl\" 
)
cd ..
copy opensslconf.h %dst_src%\include\openssl\
cd %dst_src%


echo Generate arm asm
call:gen_asm_arm crypto/aes/asm/aes-mips.pl
call:gen_asm_arm crypto/aes/asm/aes-armv4.pl
call:gen_asm_arm crypto/aes/asm/bsaes-armv7.pl
call:gen_asm_arm crypto/aes/asm/aesv8-armx.pl
call:gen_asm_arm crypto/bn/asm/armv4-gf2m.pl
call:gen_asm_arm crypto/bn/asm/armv4-mont.pl
call:gen_asm_arm crypto/modes/asm/ghash-armv4.pl
call:gen_asm_arm crypto/modes/asm/ghashv8-armx.pl
call:gen_asm_arm crypto/sha/asm/sha1-armv4-large.pl
call:gen_asm_arm crypto/sha/asm/sha256-armv4.pl
call:gen_asm_arm crypto/sha/asm/sha512-armv4.pl

call:gen_asm_arm crypto/sha/asm/sha1-armv8.pl
call:gen_asm_arm crypto/sha/asm/sha512-armv8.pl crypto/sha/asm/sha512-armv8.S
call:gen_asm_arm crypto/sha/asm/sha512-armv8.pl crypto/sha/asm/sha256-armv8.S

  
echo Generate mips asm
  call:gen_asm_mips crypto/aes/asm/aes-mips.pl
  call:gen_asm_mips crypto/bn/asm/mips.pl crypto/bn/asm/bn-mips.S
  call:gen_asm_mips crypto/bn/asm/mips-mont.pl
  call:gen_asm_mips crypto/sha/asm/sha1-mips.pl
  cd crypto/sha/asm/
  call:gen_asm_mips sha512-mips.pl sha256-mips.S
  call:gen_asm_mips sha512-mips.pl sha512-mips.S
  cd ..
  cd ..
  cd ..
 
 echo Generate mips64 asm 
  
  call:gen_asm_mips64 crypto/bn/asm/mips.pl crypto/bn/asm/mips64.S
  call:gen_asm_mips64 crypto/bn/asm/mips-mont.pl crypto/bn/asm/mips-mont64.S
  call:gen_asm_mips64 crypto/sha/asm/sha1-mips.pl crypto/sha/asm/sha1-mips64.S
  cd crypto/sha/asm/
  call:gen_asm_mips64 sha512-mips.pl sha256-mips64.S
  call:gen_asm_mips64 sha512-mips.pl sha512-mips64.S
  cd ..
  cd ..
  cd ..
	
	
echo Generate x86 asm
  call:gen_asm_x86 crypto/x86cpuid.pl
  call:gen_asm_x86 crypto/aes/asm/aes-586.pl
  call:gen_asm_x86 crypto/aes/asm/vpaes-x86.pl
  call:gen_asm_x86 crypto/aes/asm/aesni-x86.pl
  call:gen_asm_x86 crypto/bn/asm/bn-586.pl
  call:gen_asm_x86 crypto/bn/asm/co-586.pl
  call:gen_asm_x86 crypto/bn/asm/x86-mont.pl
  call:gen_asm_x86 crypto/bn/asm/x86-gf2m.pl
  call:gen_asm_x86 crypto/modes/asm/ghash-x86.pl
  call:gen_asm_x86 crypto/sha/asm/sha1-586.pl
  call:gen_asm_x86 crypto/sha/asm/sha256-586.pl
  call:gen_asm_x86 crypto/sha/asm/sha512-586.pl
  call:gen_asm_x86 crypto/md5/asm/md5-586.pl
  call:gen_asm_x86 crypto/des/asm/des-586.pl
  call:gen_asm_x86 crypto/des/asm/crypt586.pl
  call:gen_asm_x86 crypto/bf/asm/bf-586.pl
	call:gen_asm_x86 crypto/cast/asm/cast-586.pl
	call:gen_asm_x86 crypto/rc4/asm/rc4-586.pl
	call:gen_asm_x86 crypto/ripemd/asm/rmd-586.pl
	call:gen_asm_x86 crypto/rc5/asm/rc5-586.pl
	call:gen_asm_x86 crypto/camellia/asm/cmll-x86.pl

echo Generate x86_64 asm
  call:gen_asm_x86_64 crypto/x86_64cpuid.pl
  call:gen_asm_x86_64 crypto/sha/asm/sha1-mb-x86_64.pl
  call:gen_asm_x86_64 crypto/sha/asm/sha256-mb-x86_64.pl
  call:gen_asm_x86_64 crypto/sha/asm/sha1-x86_64.pl
  call:gen_asm_x86_64 crypto/sha/asm/sha512-x86_64.pl crypto/sha/asm/sha256-x86_64.S
  call:gen_asm_x86_64 crypto/sha/asm/sha512-x86_64.pl
  call:gen_asm_x86_64 crypto/modes/asm/ghash-x86_64.pl
  call:gen_asm_x86_64 crypto/modes/asm/aesni-gcm-x86_64.pl
  call:gen_asm_x86_64 crypto/aes/asm/aesni-x86_64.pl
  call:gen_asm_x86_64 crypto/aes/asm/vpaes-x86_64.pl
  call:gen_asm_x86_64 crypto/aes/asm/bsaes-x86_64.pl
  call:gen_asm_x86_64 crypto/aes/asm/aes-x86_64.pl
  call:gen_asm_x86_64 crypto/aes/asm/aesni-mb-x86_64.pl 
  call:gen_asm_x86_64 crypto/aes/asm/aesni-sha1-x86_64.pl
  call:gen_asm_x86_64 crypto/aes/asm/aesni-sha256-x86_64.pl
  call:gen_asm_x86_64 crypto/md5/asm/md5-x86_64.pl
  call:gen_asm_x86_64 crypto/bn/asm/modexp512-x86_64.pl
  call:gen_asm_x86_64 crypto/bn/asm/x86_64-mont.pl
  call:gen_asm_x86_64 crypto/bn/asm/rsaz-x86_64.pl
  call:gen_asm_x86_64 crypto/bn/asm/rsaz-avx2.pl
  call:gen_asm_x86_64 crypto/bn/asm/x86_64-gf2m.pl
  call:gen_asm_x86_64 crypto/bn/asm/x86_64-mont5.pl
  call:gen_asm_x86_64 crypto/rc4/asm/rc4-x86_64.pl
  call:gen_asm_x86_64 crypto/rc4/asm/rc4-md5-x86_64.pl
  call:gen_asm_x86_64 crypto/ec/asm/ecp_nistz256-x86_64.pl
  call:gen_asm_x86_64 crypto/camellia/asm/cmll-x86_64.pl
 
echo Generate mac_ia32 asm
  call:gen_asm_mac_ia32 crypto/x86cpuid.pl
  call:gen_asm_mac_ia32 crypto/aes/asm/aes-586.pl
  call:gen_asm_mac_ia32 crypto/aes/asm/vpaes-x86.pl
  call:gen_asm_mac_ia32 crypto/aes/asm/aesni-x86.pl
  call:gen_asm_mac_ia32 crypto/bn/asm/bn-586.pl
  call:gen_asm_mac_ia32 crypto/bn/asm/co-586.pl
  call:gen_asm_mac_ia32 crypto/bn/asm/x86-mont.pl
  call:gen_asm_mac_ia32 crypto/bn/asm/x86-gf2m.pl
  call:gen_asm_mac_ia32 crypto/modes/asm/ghash-x86.pl
  call:gen_asm_mac_ia32 crypto/sha/asm/sha1-586.pl
  call:gen_asm_mac_ia32 crypto/sha/asm/sha256-586.pl
  call:gen_asm_mac_ia32 crypto/sha/asm/sha512-586.pl
  call:gen_asm_mac_ia32 crypto/md5/asm/md5-586.pl
  call:gen_asm_mac_ia32 crypto/des/asm/des-586.pl
  call:gen_asm_mac_ia32 crypto/des/asm/crypt586.pl
  call:gen_asm_mac_ia32 crypto/bf/asm/bf-586.pl
  
echo Building Android Libraries
call ndk-build
cd ..


call rd /s /q "%cd%\%dst_src%\obj\local\arm64-v8a\objs"
call rd /s /q "%cd%\%dst_src%\obj\local\armeabi\objs"
call rd /s /q "%cd%\%dst_src%\obj\local\armeabi-v7a\objs"
call rd /s /q "%cd%\%dst_src%\obj\local\mips64\objs"
call rd /s /q "%cd%\%dst_src%\obj\local\mips\objs"
call rd /s /q "%cd%\%dst_src%\obj\local\x86\objs"
call rd /s /q "%cd%\%dst_src%\obj\local\x86_64\objs"

call xcopy "%cd%\%dst_src%\obj\local" "%cd%\openssl_android_nuget\lib\native\android\clang\" /E /H /K /y
call rd /s /q "%cd%\%dst_src%"

exit
goto:eof

:gen_asm_mac_ia32  
SETLOCAL
SET infile=%~1
SET outfile=%~2
IF "%2"=="" SET outfile=%infile:.pl=-mac.S%

call perl "%infile%" macosx > "%outfile%"
ENDLOCAL
goto:eof

:gen_asm_x86_64  
SETLOCAL
SET infile=%~1
SET outfile=%~2
IF "%2"=="" SET outfile=%infile:.pl=.S%

call perl "%infile%" elf "%outfile%" > "%outfile%"
ENDLOCAL
goto:eof

:gen_asm_x86  
SETLOCAL
SET infile=%~1
SET outfile=%~2
IF "%2"=="" SET outfile=%infile:.pl=.S%

call perl "%infile%" elf -fPIC > "%outfile%"
ENDLOCAL
goto:eof

:gen_asm_arm  
SETLOCAL
SET infile=%~1
SET outfile=%~2
IF "%2"=="" SET outfile=%infile:.pl=.S%

call perl "%infile%" elf "%outfile%" > "%outfile%"
ENDLOCAL
goto:eof

:gen_asm_mips  
SETLOCAL
SET infile=%~1
SET outfile=%~2
IF "%2"=="" SET outfile=%infile:.pl=.S%

call perl "%infile%" o32 "%outfile%" > "%outfile%"
ENDLOCAL
goto:eof


:gen_asm_mips64  
SETLOCAL
SET infile=%~1
SET outfile=%~2
IF "%2"=="" SET outfile=%infile:.pl=.S%

call perl "%infile%" 64 "%outfile%" > "%outfile%"
ENDLOCAL
goto:eof