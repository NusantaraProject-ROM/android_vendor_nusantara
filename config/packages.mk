# OTA
ifeq ($(NAD_BUILD_TYPE), OFFICIAL)
PRODUCT_PACKAGES += \
    Updater
endif

# Packages
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    DeskClock \
    CustomDoze \
    Gallery2 \
    OmniStyle \
    OmniJaws \
    QuickAccessWallet \
    messaging \
    WallpaperPicker2 \
    ThemePicker \
    WallpaperCropper2 \
    NusantaraPapersStub \
    Stk \
    GamingMode

# Allows registering device to Google easier for gapps
# Integrates package for easier Google Pay fixing
PRODUCT_PACKAGES += \
    sqlite3
