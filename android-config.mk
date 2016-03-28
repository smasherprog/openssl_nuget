#
# These flags represent the build-time configuration of OpenSSL for android
#
# The value of $(openssl_cflags) was pruned from the Makefile generated
# by running ./Configure from import_openssl.sh.
#
# This script performs minor but required patching for the Android build.
#

LOCAL_CFLAGS := $(openssl_cflags)

LOCAL_CFLAGS := $(filter-out -DTERMIO, $(LOCAL_CFLAGS))

# Intentionally excluded http://b/7079965
LOCAL_CFLAGS := $(filter-out -DZLIB, $(LOCAL_CFLAGS))

