DEVICE_FOLDER := device/hisense/rk3188

# inherit from the proprietary version
-include vendor/hisense/rk3188/BoardConfigVendor.mk

# Platform
TARGET_BOOTLOADER_BOARD_NAME := Rockchip
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Architecture
TARGET_ARCH := arm
TARGET_BOARD_PLATFORM := rk31board
TARGET_BOARD_HARDWARE := rk31board
ARCH_ARM_HAVE_ARMV7A := true
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a9
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_ARCH_VARIANT_FPU := neon
ARCH_ARM_HAVE_NEON := true
ARCH_ARM_HAVE_VFP := true
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 536870912
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2147483648
BOARD_KERNELIMAGE_PARTITION_SIZE := 16777216
BOARD_FLASH_BLOCK_SIZE := 131072

TARGET_USERIMAGES_USE_EXT4 := true

# Kernel
BOARD_KERNEL_CMDLINE := 
BOARD_KERNEL_BASE := 0x60400000
BOARD_PAGE_SIZE := 16384
TARGET_PREBUILT_KERNEL := $(DEVICE_FOLDER)/kernel
BOARD_EGL_CFG := $(DEVICE_FOLDER)/egl.cfg

# Recovery
BOARD_HAS_NO_MISC_PARTITION := true
TARGET_RECOVERY_FSTAB := $(DEVICE_FOLDER)/recovery/recovery.fstab
RECOVERY_FSTAB_VERSION := 2

BOARD_CUSTOM_GRAPHICS := ../../../device/hisense/rk3188/recovery/graphics.c ../../../device/hisense/rk3188/recovery/graphics_overlay.c

BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_PREBUILT_RECOVERY_KERNEL := $(DEVICE_FOLDER)/kernel
BOARD_HAS_LARGE_FILESYSTEM := true
#TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/mt_usb/gadget/lun%d/file"
#BOARD_UMS_LUNFILE := "/sys/class/android_usb/android0/f_mass_storage/lun/file"
#BOARD_UMS_2ND_LUNFILE := "/sys/class/android_usb/android0/f_mass_storage/lun1/file"
BOARD_USE_CUSTOM_RECOVERY_FONT:= \"roboto_15x24.h\"
DEVICE_RESOLUTION := 1280x800
TARGET_RECOVERY_PIXEL_FORMAT := "RGB_565"
#TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
#TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"

# Misc
USE_OPENGL_RENDERER := true
BOARD_USE_SKIA_LCDTEXT := true
BOARD_USES_HWCOMPOSER := true
BOARD_EGL_NEEDS_LEGACY_FB := true
ENABLE_WEBGL := true
BOARD_NEEDS_MEMORYHEAPPMEM := true
TARGET_USES_ION := true
TARGET_FORCE_CPU_UPLOAD := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := false
BOARD_HAVE_BLUETOOTH_CSR := false

#nand
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/recovery/init.recovery.rk30board.rc:root/init.recovery.rk30board.rc \
    $(DEVICE_FOLDER)/recovery/drmboot.ko:root/drmboot.ko \
    $(DEVICE_FOLDER)/recovery/rk30xxnand_ko.ko.3.0.8+:root/rk30xxnand_ko.ko.3.0.8+ \
    $(DEVICE_FOLDER)/recovery/rk30xxnand_ko.ko.3.0.36+:root/rk30xxnand_ko.ko.3.0.36+

BOARD_CUSTOM_BOOTIMG_MK := $(DEVICE_FOLDER)/custombootimg.mk
