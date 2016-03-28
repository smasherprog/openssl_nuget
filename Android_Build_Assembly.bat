SET var=%cd%\


echo Generate arm asm
call:gen_asm_arm "crypto/aes/asm/aes-armv4.pl"
call:gen_asm_arm "crypto/bn/asm/armv4-gf2m.pl"
call:gen_asm_arm "crypto/bn/asm/armv4-mont.pl"
call:gen_asm_arm "crypto/modes/asm/ghash-armv4.pl"
call:gen_asm_arm "crypto/sha/asm/sha1-armv4-large.pl"
call:gen_asm_arm "crypto/sha/asm/sha256-armv4.pl"
call:gen_asm_arm "crypto/sha/asm/sha512-armv4.pl"

echo Generate mips asm
  call:gen_asm_mips crypto/aes/asm/aes-mips.pl
  call:gen_asm_mips crypto/bn/asm/mips.pl crypto/bn/asm/bn-mips.S
  call:gen_asm_mips crypto/bn/asm/mips-mont.pl
  call:gen_asm_mips crypto/sha/asm/sha1-mips.pl
  call:gen_asm_mips crypto/sha/asm/sha512-mips.pl crypto/sha/asm/sha256-mips.S

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


goto:eof

:gen_asm_mac_ia32  
SET infile=%~1
SET outfile=%~2
IF "%2"=="" SET outfile=%infile:.pl=-mac.S%

call perl "%infile%" macosx > "%outfile%"
goto:eof

:gen_asm_x86_64  
SET infile=%~1
SET outfile=%~2
IF "%2"=="" SET outfile=%infile:.pl=.S%

call perl "%infile%" elf "%outfile%" > "%outfile%"
goto:eof

:gen_asm_x86  
SET infile=%~1
SET outfile=%~2
IF "%2"=="" SET outfile=%infile:.pl=.S%

call perl "%infile%" elf -fPIC > "%outfile%"
goto:eof

:gen_asm_arm  
SET infile=%~1
SET outfile=%~2
IF "%2"=="" SET outfile=%infile:.pl=.S%

call perl "%infile%" > "%outfile%"
goto:eof

:gen_asm_mips  
SET infile=%~1
SET outfile=%~2
IF "%2"=="" SET outfile=%infile:.pl=.S%

call perl "%infile%" o32 > "%outfile%"
goto:eof
