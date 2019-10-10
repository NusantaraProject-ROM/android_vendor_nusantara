LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_USE_AAPT2 := true

LOCAL_MODULE := VendorSupportLib

LOCAL_SHARED_ANDROID_LIBRARIES := \
    android-support-annotations \
    androidx.recyclerview_recyclerview \
    androidx.preference_preference \
    androidx.appcompat_appcompat \
    androidx.cardview_cardview

LOCAL_RESOURCE_DIR := $(LOCAL_PATH)/res

LOCAL_JAR_EXCLUDE_FILES := none

LOCAL_SRC_FILES := $(call all-java-files-under, src)

include $(BUILD_STATIC_JAVA_LIBRARY)

