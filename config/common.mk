PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PRODUCT_PROPERTIES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PRODUCT_PROPERTIES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

# General additions
PRODUCT_PRODUCT_PROPERTIES += \
    keyguard.no_require_sim=true \
    dalvik.vm.debug.alloc=0 \
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

# Allow tethering without provisioning app
PRODUCT_PRODUCT_PROPERTIES += \
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

# Weather client
#PRODUCT_COPY_FILES += \
#    vendor/du/prebuilt/common/etc/permissions/org.pixelexperience.weather.client.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/org.pixelexperience.weather.client.xml \
#    vendor/du/prebuilt/common/etc/default-permissions/org.pixelexperience.weather.client.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/default-permissions/org.pixelexperience.weather.client.xml

# Packages
include vendor/du/config/packages.mk

# Branding
include vendor/du/config/branding.mk

# Themes
include vendor/themes/common.mk

# Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/du/overlay/common
