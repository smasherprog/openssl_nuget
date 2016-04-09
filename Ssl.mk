
common_c_flags :=

common_src_files := \
  ssl/bio_ssl.c \
  ssl/d1_both.c \
  ssl/d1_clnt.c \
  ssl/d1_lib.c \
  ssl/d1_meth.c \
  ssl/d1_pkt.c \
  ssl/d1_srtp.c \
  ssl/d1_srvr.c \
  ssl/kssl.c \
  ssl/s23_clnt.c \
  ssl/s23_lib.c \
  ssl/s23_meth.c \
  ssl/s23_pkt.c \
  ssl/s23_srvr.c \
  ssl/s2_clnt.c \
  ssl/s2_enc.c \
  ssl/s2_lib.c \
  ssl/s2_meth.c \
  ssl/s2_pkt.c \
  ssl/s2_srvr.c \
  ssl/s3_both.c \
  ssl/s3_cbc.c \
  ssl/s3_clnt.c \
  ssl/s3_enc.c \
  ssl/s3_lib.c \
  ssl/s3_meth.c \
  ssl/s3_pkt.c \
  ssl/s3_srvr.c \
  ssl/ssl_algs.c \
  ssl/ssl_asn1.c \
  ssl/ssl_cert.c \
  ssl/ssl_ciph.c \
  ssl/ssl_conf.c \
  ssl/ssl_err.c \
  ssl/ssl_err2.c \
  ssl/ssl_lib.c \
  ssl/ssl_rsa.c \
  ssl/ssl_sess.c \
  ssl/ssl_stat.c \
  ssl/ssl_txt.c \
  ssl/ssl_utst.c \
  ssl/t1_clnt.c \
  ssl/t1_enc.c \
  ssl/t1_ext.c \
  ssl/t1_lib.c \
  ssl/t1_meth.c \
  ssl/t1_reneg.c \
  ssl/t1_srvr.c \
  ssl/t1_trce.c \
  ssl/tls_srp.c \

common_c_includes := \
	$(LOCAL_PATH)/crypto \
	$(LOCAL_PATH)/include \
  
armeabi_c_flags := 

armeabi_src_files := 

armeabi_exclude_files := 

armeabi-v7a_c_flags := \

armeabi-v7a_src_files := 

armeabi-v7a_exclude_files := 

armeabi-v7a-hard_c_flags := 

armeabi-v7a-hard_src_files := 

armeabi-v7a-hard_exclude_files := 
	
arm64-v8a_c_flags := 

arm64-v8a_src_files := 

arm64-v8a_exclude_files := 
	
x86_c_flags := 

x86_src_files := 

x86_exclude_files := 

x86_64_c_flags := 

x86_64_src_files := 

x86_64_exclude_files := 

mips_c_flags := 

mips_src_files := 

mips_exclude_files := 

target_arch := $(TARGET_ARCH_ABI)
  
target_c_flags    := $(common_c_flags) $($(target_arch)_c_flags)
target_c_includes := $(common_c_includes)
target_src_files  := $(common_src_files) $($(target_arch)_src_files)
target_src_files  := $(filter-out $($(target_arch)_exclude_files), $(target_src_files))

#######################################
# target shared library
include $(CLEAR_VARS)
include $(LOCAL_PATH)/android-config.mk

LOCAL_SRC_FILES += $(target_src_files)
LOCAL_CFLAGS += $(target_c_flags)
LOCAL_C_INCLUDES += $(target_c_includes)
LOCAL_SHARED_LIBRARIES += libcrypto_md
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := libssl_md
include $(BUILD_SHARED_LIBRARY)


include $(CLEAR_VARS)
include $(LOCAL_PATH)/android-config.mk

LOCAL_SRC_FILES += $(target_src_files)
LOCAL_CFLAGS += $(target_c_flags)
LOCAL_C_INCLUDES += $(target_c_includes)
LOCAL_SHARED_LIBRARIES += libcrypto_mt
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := libssl_mt
include $(BUILD_STATIC_LIBRARY)
