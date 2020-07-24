ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_PACKAGES += \
    adb_root

# Additional props
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    dalvik.vm.debug.alloc=0 \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.error.receiver.system.apps=com.google.android.gms \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dataroaming=false \
    ro.atrace.core.services=com.google.android.gms,com.google.android.gms.ui,com.google.android.gms.persistent \
    ro.setupwizard.rotation_locked=true \
    ro.com.google.ime.theme_id=5 \
    ro.storage_manager.enabled=1 \
    ro.opa.eligible_device=true \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.network_required=false \
    ro.setupwizard.gservices_delay=-1 \
    ro.setupwizard.mode=OPTIONAL \
    setupwizard.feature.predeferred_enabled=false \
    drm.service.enabled=true \
    net.tethering.noprovisioning=true \
    keyguard.no_require_sim=true \
    persist.sys.disable_rescue=true \
    persist.debug.wfd.enable=1 \
    persist.sys.wfd.virtual=0 \
    ro.build.selinux=1

PRODUCT_PROPERTY_OVERRIDES += \
    ro.services.whitelist.packagelist=com.google.android.gms

# Gapps
ifeq ($(USE_GAPPS),true)
include vendor/pixelgapps/pixel-gapps.mk
endif

# Copy all custom init rc files
$(foreach f,$(wildcard vendor/nusantara/prebuilt/common/etc/init/*.rc),\
    $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_SYSTEM)/etc/init/$(notdir $f)))

# Backup tool
PRODUCT_COPY_FILES += \
    vendor/nusantara/build/tools/backuptool.sh:install/bin/backuptool.sh \
    vendor/nusantara/build/tools/backuptool.functions:install/bin/backuptool.functions \
    vendor/nusantara/build/tools/50-nad.sh:$(TARGET_COPY_OUT_SYSTEM)/addon.d/50-nad.sh

# Permission
PRODUCT_COPY_FILES += \
    vendor/nusantara/prebuilt/common/etc/permissions/privapp-permissions-nad-system.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-du-system.xml \
    vendor/nusantara/prebuilt/common/etc/permissions/privapp-permissions-nad-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-nad-product.xml \
    vendor/nusantara/prebuilt/common/etc/permissions/privapp-permissions-recorder.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-recorder.xml \
    vendor/nusantara/prebuilt/common/etc/permissions/privapp-permissions-elgoog.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-elgoog.xml


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
    fsck.exfat \
    fsck.ntfs \
    mke2fs \
    mkfs.exfat \
    mkfs.ntfs \
    mount.ntfs

# Art
include vendor/nusantara/config/art.mk

# Branding
include vendor/nusantara/config/branding.mk

# Packages
include vendor/nusantara/config/packages.mk

# Themes
include vendor/themes/common.mk

# Overlays
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/nusantara/overlay
DEVICE_PACKAGE_OVERLAYS += vendor/nusantara/overlay/common

$(call inherit-product-if-exists, external/motorola/faceunlock/config.mk)
