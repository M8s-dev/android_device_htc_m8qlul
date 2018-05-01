# vim: ts=4 sw=4 sts=4 et
# Copyright (C) 2015 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# The gps config appropriate for this device
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, device/common/gps/gps_eu_supl.mk)
$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)
$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

# Inherit the vendor files
$(call inherit-product-if-exists, vendor/htc/m8qlul/m8qlul-vendor.mk)

# System properties
-include $(LOCAL_PATH)/system_prop.mk

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Screen density
# Device uses ultra-high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

## Dot View Case
# TODO!
#PRODUCT_PACKAGES += Dotcase

# Permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/com.htc.software.market.xml:system/etc/permissions/com.htc.software.market.xml \
    frameworks/base/nfc-extras/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:system/etc/permissions/android.hardware.camera.full.xml\
    frameworks/native/data/etc/android.hardware.camera.raw.xml:system/etc/permissions/android.hardware.camera.raw.xml\
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@2.0-impl \
    android.hardware.audio.effect@2.0-impl \
    audiod \
    audio.a2dp.default \
    audio.primary.msm8916 \
    audio.r_submix.default \
    audio.usb.default \
    libaudio-resampler \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    tinymix

# Audio configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    $(LOCAL_PATH)/configs/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/configs/audio/audio_platform_info.xml:system/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths.xml:system/etc/mixer_paths.xml \
    $(LOCAL_PATH)/configs/audio/sound_mfg.txt:system/etc/sound_mfg.txt \
    $(LOCAL_PATH)/configs/audio/sound_trigger_mixer_paths.xml:system/etc/sound_trigger_mixer_paths.xml \
    $(LOCAL_PATH)/configs/audio/sound_trigger_mixer_paths_wcd9306.xml:system/etc/sound_trigger_mixer_paths_wcd9306.xml \
    $(LOCAL_PATH)/configs/audio/sound_trigger_platform_info.xml:system/etc/sound_trigger_platform_info.xml \
    $(LOCAL_PATH)/configs/audio/soundimage/srsfx_trumedia_ext.cfg:system/etc/soundimage/srsfx_trumedia_ext.cfg \
    $(LOCAL_PATH)/configs/audio/soundimage/srsfx_trumedia_ext_HS250.cfg:system/etc/soundimage/srsfx_trumedia_ext_HS250.cfg \
    $(LOCAL_PATH)/configs/audio/soundimage/srsfx_trumedia_ext_MAX300.cfg:system/etc/soundimage/srsfx_trumedia_ext_MAX300.cfg \
    $(LOCAL_PATH)/configs/audio/soundimage/srsfx_trumedia_int.cfg:system/etc/soundimage/srsfx_trumedia_int.cfg \
    $(LOCAL_PATH)/configs/audio/soundimage/srsmodels.lic:system/etc/soundimage/srsmodels.lic

# ANT+
PRODUCT_PACKAGES += \
    AntHalService \
    com.dsi.ant.antradio_library \
    libantradio \
    antradio_app

# Bluetooth
PRODUCT_PACKAGES += \
    com.quicinc.wbc \
    android.hardware.bluetooth@1.0-impl

# Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl-m8qlul \
    libmm-qcamera \
    libshim_camera \
    Snap

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# Connectivity Engine Support
PRODUCT_PACKAGES += \
    libcnefeatureconfig \
    librmnetctl \
    libxml2

# Display
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.mapper@2.0-impl \
    android.hardware.memtrack@1.0-impl \
    copybit.msm8916 \
    gralloc.msm8916 \
    hwcomposer.msm8916 \
    memtrack.msm8916 \
    libtinyxml \
    libxml2 \
    libgenlock \
    liboverlay

# Filesystem
PRODUCT_PACKAGES += \
    e2fsck \
    make_ext4fs \
    setup_fs \
    fsck.f2fs \
    make_f2fs \
    mkfs.f2fs \
    mount.exfat

# FM
PRODUCT_PACKAGES += \
    FM2 \
    FMRecord \
    libqcomfm_jni \
    qcom.fmradio

# SIM stuff existent on stock
PRODUCT_PACKAGES += \
    requestsync \
    SmartcardService

PRODUCT_PACKAGES += \
    org.simalliance.openmobileapi \
    org.simalliance.openmobileapi.xml

# GPS
#PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/gps/flp.conf:system/etc/flp.conf \
    $(LOCAL_PATH)/gps/izat.conf:system/etc/izat.conf \
    $(LOCAL_PATH)/gps/sap.conf:system/etc/sap.conf

# IRQ balance
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/msm_irqbalance.conf:system/vendor/etc/msm_irqbalance.conf

# IPC router config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sec_config:system/etc/sec_config

# Input device config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/idc/projector_input.idc:system/usr/idc/projector_input.idc \
    $(LOCAL_PATH)/configs/idc/hsml_touchscreen.idc:system/usr/idc/hsml_touchscreen.idc \
    $(LOCAL_PATH)/configs/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc

# IPv6 tethering
PRODUCT_PACKAGES += \
    ebtables \
    ethertypes

# Keylayouts and Keychars
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/keylayout/device-keypad.kl:system/usr/keylayout/device-keypad.kl \
    $(LOCAL_PATH)/configs/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/configs/keylayout/m1120.kl:system/usr/keylayout/m1120.kl \
    $(LOCAL_PATH)/configs/keylayout/synaptics-rmi-touchscreen.kl:system/usr/keylayout/synaptics-rmi-touchscreen.kl \
    $(LOCAL_PATH)/configs/keylayout/projector-Keypad.kl:system/usr/keylayout/projector-Keypad.kl

# Keystore
PRODUCT_PACKAGES += \
    keystore.msm8916 \
    android.hardware.keymaster@3.0-impl

# Lights
PRODUCT_PACKAGES += \
    lights.msm8916 \
    android.hardware.light@2.0-service \
    android.hardware.light@2.0-impl

# Healthd
PRODUCT_PACKAGES += \
    android.hardware.health@1.0-impl \
    android.hardware.health@1.0-service

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.manager@1.0-java

# HTC Log Symbols
PRODUCT_PACKAGES += \
    liblog_shim

# RIL  
PRODUCT_PACKAGES += \
    android.hardware.radio@1.0-impl \
    libshim_ril

PRODUCT_BOOT_JARS += \
    telephony-ext

# Media config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_sw_vendor.xml:system/etc/media_codecs_sw_vendor.xml \
    $(LOCAL_PATH)/configs/media/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_performance.xml:system/etc/media_codecs_performance.xml

PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

# Netutils
PRODUCT_PACKAGES += \
    android.system.net.netd@1.0 \
    libandroid_net \
    netutils-wrapper-1.0

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.0-impl \
    android.hardware.nfc@1.0-service \
    com.android.nfc_extras \
    NfcNci \
    nfc_nci.msm8916 \
    Tag

ifneq ($(TARGET_BUILD_VARIANT),eng)
    NFCEE_ACCESS_PATH := $(LOCAL_PATH)/configs/nfc/nfcee_access.xml
else
    NFCEE_ACCESS_PATH := $(LOCAL_PATH)/configs/nfc/nfcee_access_debug.xml
endif

PRODUCT_COPY_FILES += \
    $(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml \
    $(LOCAL_PATH)/configs/nfc/libnfc-brcm.conf:system/etc/libnfc-brcm.conf \
    $(LOCAL_PATH)/configs/nfc/libnfc-nxp.conf:system/etc/libnfc-nxp.conf

# Qualcomm
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/qcom/dsi_config.xml:system/etc/data/dsi_config.xml \
    $(LOCAL_PATH)/configs/qcom/netmgr_config.xml:system/etc/data/netmgr_config.xml \
    $(LOCAL_PATH)/configs/qcom/qmi_config.xml:system/etc/data/qmi_config.xml

# Test Omx
PRODUCT_PACKAGES += \
    libOmxVdpp \
    libOmxVidcCommon \
    libmm-omxcore

# OMX
PRODUCT_PACKAGES += \
    libc2dcolorconvert \
    libdivxdrmdecrypt \
    libOmxCore \
    libOmxVdec \
    libOmxVenc \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxEvrcEnc \
    libOmxVdecHevc \
    libOmxQcelp13Enc \
    libOmxSwVencHevc \
    libOmxVidcCommon \
    libOmxSwVencMpeg4 \
    libstagefrighthw

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# Power HAL
PRODUCT_PACKAGES += \
    power.qcom \
    power.msm8916 \
    android.hardware.power@1.0-impl

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.qcom \
    fstab.swap \
    init.qcom.rc \
    init.htc.usb.rc \
    init.extras.rc \
    init.sensors.rc \
    init.qcom.power.rc \
    ueventd.qcom.rc

PRODUCT_PACKAGES += \
    init.qcom.usb.sh \
    init.qcom.sh

# Recovery
PRODUCT_PACKAGES += \
    librecovery_updater_cm

# Releasetools / Variant script (voidzero TODO: modify to static)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/releasetools/variant_script.sh:install/bin/variant_script.sh

# Sensors
PRODUCT_PACKAGES += \
    sensorservice \
    android.hardware.sensors@1.0-impl

# Thermal
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermal-engine.conf:system/etc/thermal-engine.conf

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-impl \
    android.hardware.vibrator@1.0-service

# Wifi
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service \
    libqsap_sdk \
    libQWiFiSoftApCfg \
    libwpa_client \
    hostapd \
    dhcpcd.conf \
    wpa_supplicant \
    wpa_supplicant.conf \
    libwcnss_qmi \
    wcnss_service

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/hostapd.accept:system/etc/hostapd/hostapd.accept \
    $(LOCAL_PATH)/configs/wifi/hostapd.conf:system/etc/hostapd/hostapd_default.conf \
    $(LOCAL_PATH)/configs/wifi/hostapd.deny:system/etc/hostapd/hostapd.deny \
    $(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
    $(LOCAL_PATH)/configs/wifi/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
    $(LOCAL_PATH)/configs/wifi/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin

# WiFi Display
ifneq ($(QCPATH),)
PRODUCT_BOOT_JARS += WfdCommon
endif

# Device naming
PRODUCT_DEVICE := m8qlul
PRODUCT_NAME := m8qlul
PRODUCT_BRAND := htc
PRODUCT_MODEL := HTC One M8s
PRODUCT_MANUFACTURER := HTC
