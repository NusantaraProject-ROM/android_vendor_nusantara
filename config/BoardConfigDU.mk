include vendor/du/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/du/config/BoardConfigQcom.mk
endif
include vendor/du/config/BoardConfigSoong.mk
