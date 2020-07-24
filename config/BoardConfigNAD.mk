include vendor/nusantara/config/BoardConfigKernel.mk
include vendor/nusantara/config/BoardConfigSoong.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/nusantara/config/BoardConfigQcom.mk
endif

ifneq ($(TARGET_USES_PREBUILT_CAMERA_SERVICE), true)
PRODUCT_SOONG_NAMESPACES += \
    frameworks/av/camera/cameraserver \
    frameworks/av/services/camera/libcameraservice
endif
