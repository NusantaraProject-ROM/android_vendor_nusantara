ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_PACKAGES += \
    adb_root
endif

# General additions
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    dalvik.vm.debug.alloc=0 \
    net.tethering.noprovisioning=true \
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
    ro.build.selinux=1

# SetupWizard
PRODUCT_PRODUCT_PROPERTIES += \
    setupwizard.enable_assist_gesture_training=true \
    setupwizard.feature.baseline_setupwizard_enabled=true \
    setupwizard.feature.show_pixel_tos=true \
    setupwizard.feature.show_support_link_in_deferred_setup=false \
    setupwizard.theme=glif_v3_light

# IME
PRODUCT_PRODUCT_PROPERTIES += \
    ro.com.google.ime.bs_theme=true \
    ro.com.google.ime.theme_id=5

# Allow tethering without provisioning app
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    net.tethering.noprovisioning=true

# Copy all custom init rc files
$(foreach f,$(wildcard vendor/du/prebuilt/common/etc/init/*.rc),\
    $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_SYSTEM)/etc/init/$(notdir $f)))

# Don't export PS1 in /system/etc/mkshrc.
PRODUCT_COPY_FILES += \
    vendor/du/prebuilt/common/etc/mkshrc:$(TARGET_COPY_OUT_SYSTEM)/etc/mkshrc

# Backup tool
PRODUCT_COPY_FILES += \
    vendor/du/build/tools/backuptool.sh:install/bin/backuptool.sh \
    vendor/du/build/tools/backuptool.functions:install/bin/backuptool.functions \
    vendor/du/build/tools/50-du.sh:$(TARGET_COPY_OUT_SYSTEM)/addon.d/50-du.sh \
    vendor/du/build/tools/blacklist:$(TARGET_COPY_OUT_SYSTEM)/addon.d/blacklist

# system mount
PRODUCT_COPY_FILES += \
    vendor/du/prebuilt/common/bin/system-mount.sh:install/bin/system-mount.sh

# Permission
PRODUCT_COPY_FILES += \
    vendor/du/prebuilt/common/etc/permissions/du-power-whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/du-power-whitelist.xml \
    vendor/du/prebuilt/common/etc/permissions/privapp-permissions-du-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-du-product.xml \
    vendor/du/prebuilt/common/etc/permissions/privapp-permissions-du-system.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-du-system.xml

# Hidden API whitelist
PRODUCT_COPY_FILES += \
    vendor/du/prebuilt/common/etc/permissions/du-hiddenapi-package-whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/du-hiddenapi-package-whitelist.xml

# Disable vendor restrictions
PRODUCT_RESTRICT_VENDOR_FILES := false

# Extra tools
PRODUCT_PACKAGES += \
    e2fsck \
    mke2fs \
    tune2fs \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat \
    mkfs.f2fs \
    fsck.f2fs \
    fibmap.f2fs \
    mkfs.ntfs \
    fsck.ntfs \
    mount.ntfs \
    7z \
    bash \
    bzip2 \
    curl \
    lib7z \
    powertop \
    pigz \
    tinymix \
    unrar \
    unzip \
    vim \
    rsync \
    zip

# Packages
include vendor/du/config/packages.mk

# Branding
include vendor/du/config/branding.mk

# Themes
include vendor/themes/common.mk

# Art
include vendor/du/config/art.mk

# Overlays
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/du/overlay
DEVICE_PACKAGE_OVERLAYS += vendor/du/overlay/common
