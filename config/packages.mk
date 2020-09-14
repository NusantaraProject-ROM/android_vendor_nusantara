# OTA
ifeq ($(NAD_BUILD_TYPE), OFFICIAL)

PRODUCT_PACKAGES += \
    Updater

endif

# Packages
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    CustomDoze \
    MatLog \
    Gallery2 \
    OmniStyle \
    messaging \
    WallpaperPicker2 \
    ThemePicker \
    TouchGestures \
    StitchImage

# Allows registering device to Google easier for gapps
# Integrates package for easier Google Pay fixing
#PRODUCT_PACKAGES += \
#    sqlite3
