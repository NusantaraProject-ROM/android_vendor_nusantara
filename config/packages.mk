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
    TouchGestures \
    SoftAPManager \
    StitchImage \
    StitchImageService \
    WallpaperCropper2 \
    SimpleDeviceConfig \
    NusantaraPapersStub \
    Stk \
    GamingMode

# Allows registering device to Google easier for gapps
# Integrates package for easier Google Pay fixing
PRODUCT_PACKAGES += \
    sqlite3

# Fonts
PRODUCT_PACKAGES += \
    Nusantara-Fonts
