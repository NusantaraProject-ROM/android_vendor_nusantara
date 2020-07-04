# Set all versions
DU_BUILD_TYPE ?= UNOFFICIAL
DU_VERSION_BASE := 6.5

# Set all versions
BUILD_DATE := $(shell date -u +%d%m%Y)
BUILD_TIME := $(shell date -u +%H%M)
BUILD_DATE_TIME := $(BUILD_TIME)$(BUILD_DATE)
ROM_FINGERPRINT := Corvus/$(DU_BUILD_TYPE)/$(PLATFORM_VERSION)/$(BUILD_ID)/$(BUILD_DATE)/$(BUILD_TIME)

ifeq ($(USE_GAPPS), true)
    DU_VERSION := Corvus_v$(DU_VERSION_BASE)-$(DU_BUILD)-Gapps-$(BUILD_DATE)-$(DU_BUILD_TYPE)-$(BUILD_TIME)
else
    DU_VERSION := Corvus_v$(DU_VERSION_BASE)-$(DU_BUILD)-$(BUILD_DATE)-$(DU_BUILD_TYPE)-$(BUILD_TIME)
endif

DU_PROPERTIES := \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    ro.build.datetime=$(BUILD_DATE_TIME) \
    ro.du.build.date=$(BUILD_DATE) \
    ro.du.version=$(DU_VERSION) \
    ro.du.build.type=$(DU_BUILD_TYPE) \
    ro.du.build.version=$(DU_VERSION_BASE) \
    ro.du.fingerprint=$(ROM_FINGERPRINT)
