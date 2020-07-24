#
# DU-specific macros
#
define uniq
$(if $1,$(firstword $1) $(call uniq,$(filter-out $(firstword $1),$1)))
endef
 
# Include board/platform macros
include vendor/nusantara/build/core/utils.mk

# Include platform definitions
include vendor/nusantara/build/core/qcom_boards.mk
