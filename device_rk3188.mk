$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/hisense/rk3188/rk3188-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/hisense/rk3188/overlay

LOCAL_PATH := device/hisense/rk3188
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Init files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/fstab.rk30board:root/fstab.rk30board

# Recovery
PRODUCT_PACKAGES += \
    init.recovery.rk30board.rc

# enable repeatable keys in cwm
PRODUCT_PROPERTY_OVERRIDES += \
    ro.cwm.enable_key_repeat=true

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_rk3188
PRODUCT_DEVICE := rk3188
