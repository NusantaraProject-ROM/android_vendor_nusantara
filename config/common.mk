PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

ifeq ($(TARGET_BUILD_VARIANT),eng)
# Disable ADB authentication
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.adb.secure=0
else
# Enable ADB authentication
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.adb.secure=1

# Disable extra StrictMode features on all non-engineering builds
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += persist.sys.strictmode.disable=true
endif

# Additional props
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    dalvik.vm.debug.alloc=0 \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.android.dataroaming=false \
    ro.setupwizard.rotation_locked=true \
    ro.com.google.ime.theme_id=5 \
    ro.storage_manager.enabled=1 \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.network_required=false \
    ro.setupwizard.gservices_delay=-1 \
    ro.setupwizard.mode=OPTIONAL \
    setupwizard.feature.predeferred_enabled=false \
    net.tethering.noprovisioning=true \
    persist.sys.disable_rescue=true \
    ro.build.selinux=1

PRODUCT_PROPERTY_OVERRIDES += \
    ro.services.whitelist.packagelist=com.google.android.gms

# Copy all custom init rc files
$(foreach f,$(wildcard vendor/nusantara/prebuilt/common/etc/init/*.rc),\
    $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_SYSTEM)/etc/init/$(notdir $f)))

# Backup tool
PRODUCT_COPY_FILES += \
    vendor/nusantara/build/tools/backuptool.sh:$(TARGET_COPY_OUT_SYSTEM)/install/bin/backuptool.sh \
    vendor/nusantara/build/tools/backuptool.functions:$(TARGET_COPY_OUT_SYSTEM)/install/bin/backuptool.functions \
    vendor/nusantara/build/tools/50-nad.sh:$(TARGET_COPY_OUT_SYSTEM)/addon.d/50-nad.sh

ifneq ($(AB_OTA_PARTITIONS),)
PRODUCT_COPY_FILES += \
    vendor/nusantara/build/tools/backuptool_ab.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.sh \
    vendor/nusantara/build/tools/backuptool_ab.functions:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.functions \
    vendor/nusantara/build/tools/backuptool_postinstall.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_postinstall.sh
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.ota.allow_downgrade=true
endif
endif

# Power whitelist
PRODUCT_COPY_FILES += \
    vendor/nusantara/config/permissions/nad-power-whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/nad-power-whitelist.xml

# Font service Permissions
PRODUCT_COPY_FILES += \
    vendor/nusantara/config/permissions/privapp-permissions-nad-system_ext.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-permissions-nad-system_ext.xml

ifeq ($(TARGET_USES_BLUR), true)
PRODUCT_PRODUCT_PROPERTIES += \
    ro.sf.blurs_are_expensive=1 \
    ro.surface_flinger.supports_background_blur=1
endif

# Disable vendor restrictions
PRODUCT_RESTRICT_VENDOR_FILES := false

# Strip the local variable table and the local variable type table to reduce
# the size of the system image. This has no bearing on stack traces, but will
# leave less information available via JDWP.
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true

# Enable ccache
USE_CCACHE := true

# Filesystems tools
PRODUCT_PACKAGES += \
    fsck.ntfs \
    mke2fs \
    mkfs.ntfs \
    mount.ntfs

# GMS
ifeq ($(USE_GAPPS), true)
$(call inherit-product, vendor/google/gms/config.mk)
DONT_DEXPREOPT_PREBUILTS := true
endif #USE_GAPPS

# MicroG
ifeq ($(USE_MICROG),true)
include prebuilts/prebuiltapks/microg.mk
endif # MicroG

# Offline charger
ifeq ($(USE_PIXEL_CHARGING),true)
PRODUCT_PACKAGES += \
    charger_res_images \
    product_charger_res_images
endif

TARGET_FACE_UNLOCK_SUPPORTED ?= true
ifeq ($(TARGET_FACE_UNLOCK_SUPPORTED),true)
PRODUCT_PACKAGES += \
    FaceUnlockService
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.face_unlock_service.enabled=$(TARGET_FACE_UNLOCK_SUPPORTED)
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.biometrics.face.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.biometrics.face.xml
endif

# Art
include vendor/nusantara/config/art.mk

# Branding
include vendor/nusantara/config/branding.mk

# Build fingerprint
include vendor/nusantara/config/fingerprint.mk

# Packages
include vendor/nusantara/config/packages.mk

# Themes
include vendor/themes/common.mk
#-include packages/apps/Plugins/plugins.mk

# Overlays
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/nusantara/overlay
DEVICE_PACKAGE_OVERLAYS += vendor/nusantara/overlay/common

# QTI Components
$(call inherit-product-if-exists, device/qcom/common/common.mk)
