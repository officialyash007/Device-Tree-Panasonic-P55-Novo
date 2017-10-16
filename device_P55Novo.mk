$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/Panasonic/P55Novo/P55Novo-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/Panasonic/P55Novo/overlay

LOCAL_PATH := device/Panasonic/P55Novo
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PACKAGES += \
    libxlog

# Lights
PRODUCT_PACKAGES += \
    lights.mt6592

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    libaudio-resampler \
    tinymix

PRODUCT_PACKAGES += \
    audio.primary.mt6592

PRODUCT_PACKAGES += \
    audio_policy.default

PRODUCT_PACKAGES += \
    lib_driver_cmd_mt66xx

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/configs/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf

# Wifi
PRODUCT_PACKAGES += \
    libwpa_client \
    hostapd \
    dhcpcd.conf \
    wpa_supplicant \
    wpa_supplicant.conf
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/hostapd/hostapd_default.conf:system/etc/hostapd/hostapd_default.conf \
    $(LOCAL_PATH)/configs/hostapd/hostapd.accept:system/etc/hostapd/hostapd.accept \
    $(LOCAL_PATH)/configs/hostapd/hostapd.deny:system/etc/hostapd/hostapd.deny

# Bluetooth
PRODUCT_PACKAGES += \
    libbt-vendor

PRODUCT_PACKAGES += libmt6592

PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.ril_class=MediaTekRIL

PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/configs/spn-conf.xml:system/etc/spn-conf.xml

# GPS
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/configs/agps_profiles_conf2.xml:system/etc/agps_profiles_conf2.xml

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/mtk-kpd.kl:system/usr/keylayout/mtk-kpd.kl \

# Ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/fstab.mt6592:root/fstab.mt6592 \
    $(LOCAL_PATH)/rootdir/init.mt6592.rc:root/init.mt6592.rc \
    $(LOCAL_PATH)/rootdir/init.modem.rc:root/init.modem.rc \
    $(LOCAL_PATH)/rootdir/init.recovery.mt6592.rc:root/init.recovery.mt6592.rc \
    $(LOCAL_PATH)/rootdir/init.mt6592.usb.rc:root/init.mt6592.usb.rc \
    $(LOCAL_PATH)/rootdir/twrp.fstab:recovery/root/etc/twrp.fstab \
    $(LOCAL_PATH)/rootdir/ueventd.mt6592.rc:root/ueventd.mt6592.rc \
    $(LOCAL_KERNEL):kernel

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml

# Keylayout overrides
PRODUCT_COPY_FILES_OVERRIDES += \
    system/usr/keylayout/Generic.kl

PRODUCT_PROPERTY_OVERRIDES := \
	ro.mediatek.version.release=ALPS.W10.24.p0 \
	ro.mediatek.platform=MT6592 \
	ro.mediatek.chip_ver=S01 \
	ro.mediatek.version.branch=KK1.MP1 \
	ro.mediatek.version.sdk=2 \

#USB
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.sys.usb.config=mtp

# Torch
PRODUCT_PACKAGES += \
    Torch

# FM Radio
PRODUCT_PACKAGES += \
    FMRadio \
    libfmjni \
    libfmcust \
    libmtkplayer

# YGPS
PRODUCT_PACKAGES+=\
    YGPS

# Camera
PRODUCT_PACKAGES += \
    Snap

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_P55Novo
PRODUCT_DEVICE := P55Novo

TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

PRODUCT_PACKAGES += \
    librs_jni \
    com.android.future.usb.accessory

$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)
