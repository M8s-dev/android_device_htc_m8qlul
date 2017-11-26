# vim: ts=4 sw=4 sts=4 et fdm=marker
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

# HTC One M8S (htc_m8qlul)
# Model Ids
# 0PKV10000 - HTC Europe
# msm8939 board, msm8916 kernel

BOARD_VENDOR := htc
DEVICE_PATH := device/htc/m8qlul

TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_PATH)/include

# Assertions    {{{
TARGET_OTA_ASSERT_DEVICE := htc_m8qlul
TARGET_BOARD_INFO_FILE ?= $(DEVICE_PATH)/board-info.txt
# }}}

# Architecture    {{{
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_CORTEX_A53 := true

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true
TARGET_BOARD_PLATFORM := msm8916
TARGET_BOARD_PLATFORM_GPU := qcom-adreno405
# }}}

# Bluetooth    {{{
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true
# }}}

# Bootloader    {{{
TARGET_BOOTLOADER_BOARD_NAME := msm8939
TARGET_NO_BOOTLOADER := true
# }}}

# ANT+    {{{
#BOARD_ANT_WIRELESS_DEVICE := "vfs-prerelease"
BOARD_ANT_WIRELESS_DEVICE := "qualcomm-smd"
# }}}

# Audio    {{{
BOARD_USES_ALSA_AUDIO := true
AUDIO_FEATURE_DEEP_BUFFER_RINGTONE := true
AUDIO_FEATURE_ENABLED_ACDB_LICENSE := true
AUDIO_FEATURE_ENABLED_EXTN_FORMATS := true
AUDIO_FEATURE_ENABLED_FLAC_OFFLOAD := true
AUDIO_FEATURE_ENABLED_FM := true
AUDIO_FEATURE_ENABLED_HFP := true
AUDIO_FEATURE_ENABLED_KPI_OPTIMIZE := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
AUDIO_FEATURE_ENABLED_LOW_LATENCY_CAPTURE := true
AUDIO_FEATURE_LOW_LATENCY_PRIMARY := true
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true
AUDIO_FEATURE_ENABLED_NEW_SAMPLE_RATE := true
USE_CUSTOM_AUDIO_POLICY := 1
# }}}

# Camera    {{{
# BOARD_CAMERA_SENSORS := imx214
BOARD_NUMBER_OF_CAMERAS := 4

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    persist.camera.maxopen=4

# Camera
TARGET_SPECIFIC_CAMERA_PARAMETER_LIBRARY := libcamera_parameters_ext
USE_DEVICE_SPECIFIC_CAMERA := true
TARGET_HAS_LEGACY_CAMERA_HAL1 := true
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true
#COMMON_GLOBAL_CFLAGS += -DPROPERTY_PERMS_APPEND='{"htc.camera.sensor.", AID_CAMERA, 0}, {"camera.4k2k.", AID_MEDIA, 0},'

# }}}

# CPU    {{{
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true
ARCH_ARM_HAVE_TLS_REGISTER := true
# }}}

# Crypto    {{{
TARGET_HW_DISK_ENCRYPTION := true
TARGET_KEYMASTER_WAIT_FOR_QSEE := true	
# }}}

# Display    {{{
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
TARGET_CONTINUOUS_SPLASH_ENABLED := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
TARGET_USES_OVERLAY := true
USE_OPENGL_RENDERER := true
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
# }}}

# Dexopt    {{{
ifeq ($(HOST_OS),linux)
  ifeq ($(WITH_DEXPREOPT),)
    WITH_DEXPREOPT := true
  endif
endif
# }}}

# Fonts    {{{
EXTENDED_FONT_FOOTPRINT := true
# }}}

# GPS    {{{
TARGET_GPS_HAL_PATH := $(DEVICE_PATH)/gps
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := true
# }}}

# Init    {{{
TARGET_PLATFORM_DEVICE_BASE := /devices/soc.0/
# }}}

# Kernel    {{{
BOARD_CUSTOM_BOOTIMG_MK := $(DEVICE_PATH)/mkbootimg.mk
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x01f88000 --tags_offset 0x01d88000
BOARD_KERNEL_BASE := 0x80078000
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom user_debug=31 ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci androidboot.selinux=permissive lpm_levels.sleep_disabled=1 boot_cpus=0-7 androidtouch.htc_event=1 disk_mode_enable=1 zswap.enabled=1

BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_SEPARATED_DT := true
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_KERNEL_TAGS_OFFSET := 0x01d88000
BOARD_RAMDISK_OFFSET := 0x01f88000
TARGET_KERNEL_SOURCE := kernel/htc/msm8939
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_USES_UNCOMPRESSED_KERNEL := true
TARGET_KERNEL_CONFIG := m8qlul_vz_defconfig
ENABLE_CPUSETS := true
# }}}

# Lights    {{{
TARGET_PROVIDES_LIBLIGHT := true
# }}}

# Malloc    {{{
MALLOC_SVELTE := true
# }}}

# NFC   {{{
BOARD_NFC_CHIPSET := pn547
# }}}

# Offmode Charging   {{{
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/htc_lpm/lpm_mode
#COMMON_GLOBAL_CFLAGS += \
    -DBOARD_CHARGING_CMDLINE_NAME='"androidboot.mode"' \
    -DBOARD_CHARGING_CMDLINE_VALUE='"chargerlogo"'
# }}}

# Partitions    {{{
BOARD_FLASH_BLOCK_SIZE             := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE     := 33554432    # 0x002000000
BOARD_CACHEIMAGE_PARTITION_SIZE    := 268435456   # 0x010000000
BOARD_PERSISTIMAGE_PARTITION_SIZE  := 262144      # 0x000040000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432    # 0x002000000
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 4294967296  # 0x100000000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 10334748672 # 0x268000000 ~ 10334765056 - 16384
# }}}

# Power    {{{
CM_POWERHAL_EXTENSION := qcom
TARGET_POWERHAL_VARIANT := qcom
# }}}

# Preload {{{
TARGET_LDPRELOAD := libNimsWrap.so
# }}}

# Properties    {{{
TARGET_SYSTEM_PROP += \
    $(DEVICE_PATH)/ril.prop \
    $(DEVICE_PATH)/extra.prop
# }}}

# Qualcomm support    {{{
BOARD_USES_QC_TIME_SERVICES := true
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_CYANOGEN_HARDWARE := true
# }}}

# TWRP {{{
ifeq ($(WITH_TWRP),true)
RECOVERY_VARIANT := twrp
TW_THEME := portrait_hdpi
TW_NO_REBOOT_BOOTLOADER := true
TW_NO_REBOOT_RECOVERY := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab
endif
# }}}

# Recovery    {{{
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
BOARD_USES_MMCUTILS := true
TARGET_RECOVERY_UPDATER_LIBS := librecovery_updater_m8qlul
ifneq ($(WITH_TWRP),true)
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom
endif
TARGET_RECOVERY_PIXEL_FORMAT := "RGB_565"
TARGET_RECOVERY_DENSITY := xxhdpi
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_RECOVERY_DEVICE_MODULES += chargeled
# }}}

# Releasetools    {{{
#TARGET_RELEASETOOLS_EXTENSIONS := $(VENDOR_PATH)
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)/releasetools

# }}}

# RIL    {{{
#PROTOBUF_SUPPORTED := true
TARGET_RIL_VARIANT := caf
#BOARD_PROVIDES_LIBRIL := true
#BOARD_RIL_NO_CELLINFOLIST := true
#BOARD_RIL_FIVE_SEARCH_RESPONSES := true
# }}}

# SELinux    {{{
include device/qcom/sepolicy/sepolicy.mk

BOARD_SEPOLICY_DIRS += \
    $(DEVICE_PATH)/sepolicy

# }}}

# Shim {{{
LINKER_FORCED_SHIM_LIBS := /system/lib/liblog.so|/system/lib/liblog_shim.so:/system/lib64/liblog.so|/system/lib64/liblog_shim.so:/system/lib64/libril.so|/system/lib64/libshim_ril.so:/system/lib/libstagefright.so|/system/lib/libshim_camera.so:/system/lib64/libstagefright.so|/system/lib64/libshim_camera.so:/system/lib/libandroid_runtime.so|libshim_camera.so:/system/lib64/libandroid_runtime.so|libshim_camera.so:/system/lib/libmedia.so|libshim_camera.so:/system/lib64/libmedia.so|libshim_camera.so
# }}}

# Video    {{{
TARGET_HAVE_SIGNED_VENUS_FW := true
# }}}

# Vold    {{{
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file
# }}}

# Wifi    {{{
BOARD_HAS_QCOM_WLAN := true
BOARD_HAS_QCOM_WLAN_SDK := true

BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_qcwcn

BOARD_WLAN_DEVICE := qcwcn

BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
TARGET_USES_QCOM_WCNSS_QMI := true
TARGET_USES_WCNSS_CTRL := true
WIFI_DRIVER_MODULE_NAME := "wlan"
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/wlan.ko"

WIFI_DRIVER_FW_PATH_AP := "ap"
WIFI_DRIVER_FW_PATH_STA := "sta"

WPA_SUPPLICANT_VERSION := VER_0_8_X
# }}}

# Inherit from the proprietary version    {{{
-include vendor/htc/m8qlul/BoardConfigVendor.mk
# }}}

# vim: ts=4 sw=4 sts=4 et fdm=marker ft=make
