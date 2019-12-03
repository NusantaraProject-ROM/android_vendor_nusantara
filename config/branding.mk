# Versioning System
DU_BUILD_TYPE := BETA

# Set all versions
BUILD_DATE := $(shell date -u +%Y%m%d)
BUILD_TIME := $(shell date -u +%H%M)
BUILD_DATE_TIME := $(BUILD_TIME)$(BUILD_DATE)
DU_VERSION := DureX-$(DU_BUILD_TYPE)-$(PLATFORM_VERSION)-$(DU_BUILD)-$(BUILD_DATE)-$(BUILD_TIME)
TARGET_BACON_NAME := $(DU_VERSION)
ROM_FINGERPRINT := Durex/$(DU_BUILD_TYPE)/$(PLATFORM_VERSION)/$(BUILD_ID)/$(BUILD_DATE)/$(BUILD_TIME)

DU_PROPERTIES := \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    ro.build.datetime=$(BUILD_DATE_TIME) \
    ro.du.build.date=$(BUILD_DATE) \
    ro.du.version=$(DU_VERSION) \
    ro.du.fingerprint=$(ROM_FINGERPRINT)
