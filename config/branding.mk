NAD_VERSION_BASE := 1.0

# Set all versions
BUILD_DATE := $(shell date -u +%d%m%Y)
BUILD_TIME := $(shell date -u +%H%M)
BUILD_DATE_TIME := $(BUILD_TIME)$(BUILD_DATE)
ROM_FINGERPRINT := Nusantara/$(NAD_VERSION_BASE)/$(PLATFORM_VERSION)/$(BUILD_ID)/$(BUILD_DATE)/$(BUILD_TIME)

ifeq ($(USE_GAPPS), true)
    NAD_VERSION := Nusantara_v$(NAD_VERSION_BASE)-$(NAD_BUILD)-Gapps-$(BUILD_DATE)-$(BUILD_TIME)
else
    NAD_VERSION := Nusantara_v$(NAD_VERSION_BASE)-$(NAD_BUILD)-$(BUILD_DATE)-$(BUILD_TIME)
endif

NAD_PROPERTIES := \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    ro.build.datetime=$(BUILD_DATE_TIME) \
    ro.nad.build.date=$(BUILD_DATE) \
    ro.nad.version=$(NAD_VERSION) \
    ro.nad.build.version=$(NAD_VERSION_BASE) \
    ro.nad.fingerprint=$(ROM_FINGERPRINT)
