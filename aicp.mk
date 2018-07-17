# Release name
PRODUCT_RELEASE_NAME := m8qlul

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080
-include vendor/aicp/config/bootanimation.mk

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/aicp/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/htc/m8qlul/full_m8qlul.mk)

BOARD_VENDOR := htc

# Device naming
PRODUCT_NAME := aicp_m8qlul
PRODUCT_DEVICE := m8qlul
PRODUCT_BRAND := htc
PRODUCT_MANUFACTURER := HTC
PRODUCT_MODEL := HTC One M8s

# AICP Device Maintainers
+PRODUCT_BUILD_PROP_OVERRIDES += \
     DEVICE_MAINTAINERS="Chris Papageorgiou (root-expert)" \
     PRODUCT_NAME="HTC One M8s" \
     PRODUCT_DEVICE="m8qlul"

# Set build fingerprint / ID / Product Name etc.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=m8qlul_htc_europe TARGET_DEVICE=htc_m8qlul

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="2.10.401.1 CL743364 release-keys"

BUILD_FINGERPRINT := "htc/m8qlul_htc_europe/htc_m8qlul:6.0.1/MMB29M/743364.1:user/release-keys"
