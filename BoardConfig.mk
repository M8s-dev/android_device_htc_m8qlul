#
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

# Model Ids
# 0PKV10000 - HTC Europe
# msm8939 board, msm8916 kernel

# (mkv) means added by mkvendor.sh
# (yut) means yu tomato

# Inherit from cyanogenmod's msm8939-common
-include device/cyanogen/msm8939-common/BoardConfigCommon.mk

DEVICE_PATH := device/htc/m8qlul

TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_PATH)/include

# (mkv) USE_CAMERA_STUB := true

# Assertions
TARGET_OTA_ASSERT_DEVICE := htc_m8qlul,m8s,m8qlul
TARGET_BOARD_INFO_FILE ?= $(DEVICE_PATH)/board-info.txt

# Kernel
#TARGET_KERNEL_CONFIG := cm_m8qlul_defconfig
TARGET_KERNEL_CONFIG := cyanogenmod_tomato-64_defconfig
#TARGET_PREBUILT_KERNEL := device/htc/m8qlul/kernel


# Below here was taken from Yu Tomato, unless mentioned otherwise
# I think it is a similar device
# Properties (yut)
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Bluetooth (yut)
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# Camera (yut)
BOARD_CAMERA_SENSORS := imx135 imx214 ov5648
TARGET_USE_VENDOR_CAMERA_EXT := true
USE_DEVICE_SPECIFIC_CAMERA := true

# CMHW (yut)
BOARD_HARDWARE_CLASS += $(DEVICE_PATH)/cmhw/src

# Compression - Smoosh all the things
TARGET_TRANSPARENT_COMPRESSION_METHOD := lz4

# CPU
TARGET_CPU_CORTEX_A53 := true

# Dexopt, only if we can fit that in
ifneq ($(TARGET_TRANSPARENT_COMPRESSION_METHOD),)
ifeq ($(HOST_OS),linux)
  ifeq ($(TARGET_BUILD_VARIANT),user)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
    endif
  endif
endif
endif

# GPS (yut)
TARGET_GPS_HAL_PATH := $(DEVICE_PATH)/gps
TARGET_NO_RPC := true

# init (yut)
TARGET_LIBINIT_DEFINES_FILE := $(DEVICE_PATH)/init/init_m8qlul.c

# Lights (yut)
TARGET_PROVIDES_LIBLIGHT := true

# Partitions (me)
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x02000000
BOARD_CACHEIMAGE_PARTITION_SIZE := 0x10000000
BOARD_PERSISTIMAGE_PARTITION_SIZE := 0x00040000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x02000000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x100000000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x268000000

# Recovery (yut)
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := ABGR_8888
TARGET_RECOVERY_DENSITY := xhdpi
TARGET_USERIMAGES_USE_EXT4 := true

# SELinux (yut)
BOARD_SEPOLICY_DIRS += \
    $(DEVICE_PATH)/sepolicy

BOARD_SEPOLICY_UNION += \
    bluetooth_loader.te \
    file.te \
    file_contexts \
    system_app.te \
    system_server.te \
    system.te \
    wcnss_service.te

# Wifi (yut)
TARGET_PROVIDES_WCNSS_QMI := true
TARGET_USES_QCOM_WCNSS_QMI := true
# The uncompressed arm64 is too large, split wifi for now (yut)
# WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/wlan.ko"
# WIFI_DRIVER_MODULE_NAME := "wlan"

# (mkv)
ARCH_ARM_HAVE_TLS_REGISTER := true

# Vendor Init (me)
TARGET_UNIFIED_DEVICE := true
TARGET_INIT_VENDOR_LIB := libinit_m8qlul
TARGET_LIBINIT_DEFINES_FILE := device/htc/m8qlul/init/init_m8qlul.c



# Inherit from the proprietary version
-include vendor/htc/m8qlul/BoardConfigVendor.mk
