SET var=%cd%
set filename=%~1

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

call Android_Build_Assembly.bat
call ndk-build
cd ..

echo "%cd%\openssl-android\libs" "%cd%\openssl\lib\native\andriod\"
call xcopy "%cd%\openssl-android\libs" "%cd%\openssl\lib\native\andriod\" /E /H /K /y

call rd /s /q "openssl-android" 