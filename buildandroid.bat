set SEVENZIP="C:\Program Files\7-Zip\7z.exe"
set foundfile=""
SET var=%cd%
for %%g in (*.gz) do set foundfile=%%~ng
set filename=%foundfile:.tar=%

call xcopy "%var%\%filename%" "%var%\openssl-android\" /E /H /K /y

copy Android.mk openssl-android\
copy android-config.mk openssl-android\
copy build-config.mk openssl-android\
copy Crypto.mk openssl-android\
copy Ssl.mk openssl-android\
copy Android_Build_Assembly.bat openssl-android\
copy AndroidManifest.xml openssl-android\

mkdir openssl-android\jni
mkdir openssl-android\include\openssl
copy Application.mk openssl-android\jni\
cd openssl-android

FOR /R %%G in (*.h) DO (
	call copy "%%G" "%cd%\include\openssl\" 
)
cd ..
copy opensslconf.h openssl-android\include\openssl\
cd openssl-android


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

call xcopy "%cd%\openssl-android\libs" "%cd%\openssl\lib\native\android\clang\" /E /H /K /y

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