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

-include device/cyanogen/msm8939-common/BoardConfigCommon.mk

DEVICE_PATH := device/xiaomi/ferrari

TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_PATH)/include

# Assertions
TARGET_BOARD_INFO_FILE ?= $(DEVICE_PATH)/board-info.txt

# Kernel
BOARD_MKBOOTIMG_ARGS               := --ramdisk_offset 0x02000000 --tags_offset 0x01E00000
BOARD_KERNEL_CMDLINE               := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom msm_rtb.filter=0x237 ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci lpm_levels.sleep_disabled=1 earlyprintk
BOARD_KERNEL_SEPARATED_DT          := true
BOARD_KERNEL_BASE                  := 0x80000000
BOARD_KERNEL_PAGESIZE              := 2048
BOARD_KERNEL_TAGS_OFFSET           := 0x01E00000
BOARD_RAMDISK_OFFSET               := 0x02000000
TARGET_KERNEL_SOURCE               := kernel/xiaomi/ferrari
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_CONFIG := ferrari_debug_defconfig
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_USES_UNCOMPRESSED_KERNEL := true

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# Camera
BOARD_CAMERA_SENSORS := imx135_cp8675 imx214_cp8675 ov5648_cp8675
TARGET_USE_VENDOR_CAMERA_EXT := true
USE_DEVICE_SPECIFIC_CAMERA := true

# CMHW
BOARD_HARDWARE_CLASS += $(DEVICE_PATH)/cmhw/src

# CPU
TARGET_CPU_CORTEX_A53 := true

# GPS
TARGET_GPS_HAL_PATH := $(DEVICE_PATH)/gps
TARGET_NO_RPC := true

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x02000000
BOARD_CACHEIMAGE_PARTITION_SIZE := 402653184
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x02000000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1744830464
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2988269568 # 13576192000 - 16384

# Recovery
RECOVERY_FSTAB_VERSION := 2
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/root/fstab.qcom
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
TARGET_RECOVERY_LCD_BACKLIGHT_PATH := \"/sys/class/leds/lcd-backlight/brightness\"
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_RECOVERY_DENSITY := hdpi

# Vold
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun0/file

# TWRP-Specific
TW_THEME 							:= portrait_hdpi
BOARD_HAS_NO_REAL_SDCARD 			:= true
RECOVERY_SDCARD_ON_DATA 			:= true
TW_INCLUDE_CRYPTO 					:= true
TW_CRYPTO_FS_TYPE 					:= "ext4"
TW_INCLUDE_JB_CRYPTO 				:= true
TW_INCLUDE_FUSE_EXFAT 				:= true
TW_EXCLUDE_ENCRYPTED_BACKUPS 		:= true
TW_INCLUDE_L_CRYPTO 				:= true
TW_BRIGHTNESS_PATH 					:= /sys/class/leds/lcd-backlight/brightness
RECOVERY_GRAPHICS_USE_LINELENGTH 	:= true
BOARD_SUPPRESS_SECURE_ERASE 		:= true
TW_USE_TOOLBOX 						:= true
TW_EXCLUDE_SUPERSU 					:= true
TW_EXCLUDE_MTP 						:= true
TW_TARGET_USES_QCOM_BSP 			:= true
TW_NO_SCREEN_BLANK 					:= true
TW_MAX_BRIGHTNESS 					:= 255
TW_NEW_ION_HEAP 					:= true

# Video
TARGET_HAVE_SIGNED_VENUS_FW := true

# SELinux
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
    
# Qualcomm support
BOARD_USES_QC_TIME_SERVICES := true
ifneq ($(QCPATH),)
BOARD_USES_QCNE := true
endif
BOARD_USES_QCOM_HARDWARE := true

# Wifi
TARGET_PROVIDES_WCNSS_QMI := true
TARGET_USES_QCOM_WCNSS_QMI := true
# The uncompressed arm64 is too large, split wifi for now
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME := "wlan"

# inherit from the proprietary version
-include vendor/xiaomi/ferrari/BoardConfigVendor.mk
