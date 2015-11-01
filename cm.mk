# Release name
PRODUCT_RELEASE_NAME := m8qlul

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit device configuration
$(call inherit-product, device/htc/m8qlul/full_m8qlul.mk)

BOARD_VENDOR := htc
BOARD_NUMBER_OF_CAMERAS := 4

# Device naming
PRODUCT_NAME := cm_m8qlul
PRODUCT_DEVICE := m8qlul
PRODUCT_BRAND := htc
PRODUCT_MANUFACTURER := HTC

# Set build fingerprint / ID / Product Name etc.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=m8qlul_htc_europe TARGET_DEVICE=htc_m8qlul

## Use the latest approved GMS identifiers unless running a signed build
ifneq ($(SIGN_BUILD),true)
PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT=htc/m8qlul_htc_europe/htc_m8qlul:5.0.2/LRX22G/555949.10:user/release-keys \
    PRIVATE_BUILD_DESC="1.16.401.10 CL555949 release-keys"
endif
