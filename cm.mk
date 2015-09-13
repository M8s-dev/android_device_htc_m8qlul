#
# Copyright (C) 2015 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

$(call inherit-product, device/htc/m8qlul/full_m8qlul.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_NAME := cm_m8qlul
BOARD_VENDOR := htc
PRODUCT_DEVICE := m8qlul

#PRODUCT_GMS_CLIENTID_BASE := android-micromax

#TARGET_VENDOR_PRODUCT_NAME := m8qlul
#TARGET_VENDOR_DEVICE_NAME := m8qlul
#PRODUCT_BUILD_PROP_OVERRIDES += TARGET_DEVICE=m8qlul PRODUCT_NAME=m8qlul


## Use the latest approved GMS identifiers unless running a signed build
ifneq ($(SIGN_BUILD),true)
PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT=htc/m8qlul_htc_europe/htc_m8qlul:5.0.2/LRX22G/555949.10:user/release-keys \
    PRIVATE_BUILD_DESC="1.16.401.10 CL555949 release-keys"
endif
