include vendor/nusantara/config/BoardConfigKernel.mk
include vendor/nusantara/config/BoardConfigSoong.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/nusantara/config/BoardConfigQcom.mk
endif
