NAD_VERSION_BASE := 4.8
NAD_BUILD_CODENAME := Surakarta
NAD_BUILD_TYPE ?= UNOFFICIAL
NAD_OTA_BRANCH := 12L

# Set all versions
BUILD_DATE := $(shell date -u +%d%m%Y)
BUILD_TIME := $(shell date -u +%H%M)
ROM_FINGERPRINT := Nusantara/$(NAD_VERSION_BASE)/$(PLATFORM_VERSION)/$(NAD_BUILD_TYPE)/$(BUILD_ID)/$(BUILD_DATE)/$(BUILD_TIME)

ifndef
     NAD_VERSION := Nusantara-v$(NAD_VERSION_BASE)-$(NAD_OTA_BRANCH)-$(NAD_BUILD)-$(BUILD_DATE)-$(NAD_BUILD_TYPE)-$(BUILD_TIME)
 ifeq ($(USE_GAPPS),true)
     NAD_VERSION := Nusantara-v$(NAD_VERSION_BASE)-$(NAD_OTA_BRANCH)-$(NAD_BUILD)-Gapps-$(BUILD_DATE)-$(NAD_BUILD_TYPE)-$(BUILD_TIME)
 else ifeq ($(USE_MICROG),true)
     NAD_VERSION := Nusantara-v$(NAD_VERSION_BASE)-$(NAD_OTA_BRANCH)-$(NAD_BUILD)-MicroG-$(BUILD_DATE)-$(NAD_BUILD_TYPE)-$(BUILD_TIME)
 endif
endif

NAD_PROPERTIES := \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    ro.nad.build.date=$(BUILD_DATE) \
    ro.nad.version=$(NAD_VERSION) \
    ro.nad.build.type=$(NAD_BUILD_TYPE) \
    ro.nad.build.version=$(NAD_VERSION_BASE) \
    ro.nad.build_codename=$(NAD_BUILD_CODENAME) \
    ro.nad.fingerprint=$(ROM_FINGERPRINT) \
    ro.nad.ota.version_code=$(NAD_OTA_BRANCH)

# Var definition for jenkins script
$(info) $(shell echo $(NAD_VERSION) > $(OUT_DIR)/var-file_name)
