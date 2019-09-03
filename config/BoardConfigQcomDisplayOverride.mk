QCOM_HARDWARE_VARIANT := $(FORCE_QCOM_DISPLAY_HAL_VARIANT)

include vendor/du/config/BoardConfigQcomUmPlatform.mk

PRODUCT_SOONG_NAMESPACES += hardware/qcom/display-caf/$(QCOM_HARDWARE_VARIANT)
