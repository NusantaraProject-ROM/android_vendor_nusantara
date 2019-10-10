#
# Include this make file to build your application against this module.
#
# Make sure to include it after you've set all your desired LOCAL variables.
# Note that you must explicitly set your LOCAL_RESOURCE_DIR before including
# this file.
#
# For example:
#
#   LOCAL_RESOURCE_DIR := \
#        $(LOCAL_PATH)/res
#
#   include vendor/support/common.mk
#

ifeq ($(LOCAL_USE_AAPT2),true)
LOCAL_STATIC_ANDROID_LIBRARIES += \
    android-support-annotations \
    androidx.preference_preference \
    androidx.recyclerview_recyclerview \
    androidx.cardview_cardview \
    androidx.appcompat_appcompat \
    VendorSupportLib
else
LOCAL_RESOURCE_DIR += $(call my-dir)/res


## Include transitive dependencies below

# Include support-v7-appcompat, if not already included
ifeq (,$(findstring androidx.appcompat_appcompat,$(LOCAL_STATIC_JAVA_LIBRARIES)))
LOCAL_RESOURCE_DIR += frameworks/support/appcompat/res
LOCAL_AAPT_FLAGS += --extra-packages androidx.appcompat_appcompat
LOCAL_STATIC_JAVA_LIBRARIES += androidx.appcompat_appcompat
endif

# Include support-v7-recyclerview, if not already included
ifeq (,$(findstring androidx.recyclerview_recyclerview,$(LOCAL_STATIC_JAVA_LIBRARIES)))
LOCAL_RESOURCE_DIR += frameworks/support/recyclerview/res
LOCAL_AAPT_FLAGS += --extra-packages androidx.recyclerview_recyclerview
LOCAL_STATIC_JAVA_LIBRARIES += androidx.recyclerview_recyclerview
endif

# Include android-support-v14-preference, if not already included
ifeq (,$(findstring androidx.preference_preference,$(LOCAL_STATIC_JAVA_LIBRARIES)))
LOCAL_RESOURCE_DIR += frameworks/support/preference/res
LOCAL_AAPT_FLAGS += --extra-packages androidx.preference_preference
LOCAL_STATIC_JAVA_LIBRARIES += androidx.preference_preference
endif

LOCAL_AAPT_FLAGS += --auto-add-overlay --extra-packages com.dirtyunicorns.support

LOCAL_STATIC_JAVA_LIBRARIES += \
    android-support-annotations \
    VendorSupportLib
endif
