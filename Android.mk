LOCAL_PATH:= $(call my-dir)

my_archs := arm
# arm64 x86 x86_64
my_src_arch := $(call get-prebuilt-src-arch, $(my_archs))

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := uSensAR
LOCAL_MODULE_CLASS := APPS
LOCAL_CERTIFICATE := platform
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_MULTILIB := 32
#LOCAL_MODULE_PATH := $(TARGET_OUT)/preloadapp
LOCAL_SRC_FILES := UnisocAR_0.9.8a.apk
LOCAL_DEX_PREOPT:=false

LOCAL_PREBUILT_JNI_LIBS := \
    lib/$(my_src_arch)/libgnustl_shared.so \
    lib/$(my_src_arch)/libil2cpp.so \
    lib/$(my_src_arch)/libmain.so \
    lib/$(my_src_arch)/libmarker_slam.so \
    lib/$(my_src_arch)/libunity.so \
    lib/$(my_src_arch)/libuSensARKit.so \
    lib/$(my_src_arch)/libargo-jni.so \
    lib/$(my_src_arch)/librecapturer.so \
    lib/$(my_src_arch)/librecapturer16.so \
    lib/$(my_src_arch)/librecmedia.so

#LOCAL_POST_INSTALL_CMD := mkdir -p $(TARGET_OUT)/app/uSensAR/lib/arm/;\
#    cp $(LOCAL_PATH)/lib/*.so $(TARGET_OUT)/app/uSensAR/lib/arm/
LOCAL_MODULE_TARGET_ARCH := $(my_src_arch)
include $(BUILD_PREBUILT)
