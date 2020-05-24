# Set all versions
DU_BUILD_TYPE ?= UNOFFICIAL

ifeq ($(DU_BUILD_TYPE), OFFICIAL)
endif

# Set all versions
BUILD_DATE := $(shell date -u +%d%m%Y)
BUILD_TIME := $(shell date -u +%H%M)
BUILD_DATE_TIME := $(BUILD_TIME)$(BUILD_DATE)
ROM_FINGERPRINT := Corvus/$(DU_BUILD_TYPE)/$(PLATFORM_VERSION)/$(BUILD_ID)/$(BUILD_DATE)/$(BUILD_TIME)

ifeq ($(USE_GAPPS), true)
    DU_VERSION := Corvus_v5.5-$(DU_BUILD)-Gapps-$(BUILD_DATE)-$(DU_BUILD_TYPE)-$(BUILD_TIME)
else
    DU_VERSION := Corvus_v5.5-$(DU_BUILD)-$(BUILD_DATE)-$(DU_BUILD_TYPE)-$(BUILD_TIME)
endif

DU_PROPERTIES := \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    ro.build.datetime=$(BUILD_DATE_TIME) \
    ro.du.build.date=$(BUILD_DATE) \
    ro.du.version=$(DU_VERSION) \
    ro.du.fingerprint=$(ROM_FINGERPRINT)
