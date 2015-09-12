## Specify phone tech before including full_phone
#$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := m8qlul

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/htc/m8qlul/device_m8qlul.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := m8qlul
PRODUCT_NAME := cm_m8qlul
PRODUCT_BRAND := htc
PRODUCT_MODEL := m8qlul
PRODUCT_MANUFACTURER := htc
