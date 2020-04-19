ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_PACKAGES += \
    adb_root

# General additions
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.error.receiver.system.apps=com.google.android.gms \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dataroaming=false \
    ro.atrace.core.services=com.google.android.gms,com.google.android.gms.ui,com.google.android.gms.persistent \
    ro.com.android.dateformat=MM-dd-yyyy \
    persist.debug.wfd.enable=1 \
    persist.sys.wfd.virtual=0 \
    ro.setupwizard.rotation_locked=true \
    ro.build.selinux=1 \
    persist.sys.disable_rescue=true

# Gapps
ifeq ($(USE_GAPPS),true)
include vendor/pixelgapps/pixel-gapps.mk
endif

# Copy all custom init rc files
$(foreach f,$(wildcard vendor/du/prebuilt/common/etc/init/*.rc),\
    $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_SYSTEM)/etc/init/$(notdir $f)))

# Backup tool
PRODUCT_COPY_FILES += \
    vendor/du/build/tools/backuptool.sh:install/bin/backuptool.sh \
    vendor/du/build/tools/backuptool.functions:install/bin/backuptool.functions \
    vendor/du/build/tools/50-du.sh:$(TARGET_COPY_OUT_SYSTEM)/addon.d/50-du.sh

# Permission
PRODUCT_COPY_FILES += \
    vendor/du/prebuilt/common/etc/permissions/du-power-whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/du-power-whitelist.xml \
    vendor/du/prebuilt/common/etc/permissions/privapp-permissions-du-system.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-du-system.xml \
    vendor/du/prebuilt/common/etc/permissions/privapp-permissions-du-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-du-product.xml \
    vendor/du/prebuilt/common/etc/permissions/du-hiddenapi-package-whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/du-hiddenapi-package-whitelist.xml

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
include vendor/du/config/art.mk

# Branding
include vendor/du/config/branding.mk

# Packages
include vendor/du/config/packages.mk

# Themes
include vendor/themes/common.mk

# Overlays
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/du/overlay
DEVICE_PACKAGE_OVERLAYS += vendor/du/overlay/common
