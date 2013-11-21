$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

$(call inherit-product-if-exists, vendor/zte/digger/digger-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/zte/digger/overlay

# This device is xhdpi.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi
PRODUCT_LOCALES += xhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# adb + root
ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.secure=0 \
	ro.allow.mock.location=0 \
	ro.adb.secure=0 \
	ro.debuggable=1 \
	persist.sys.usb.config=mass_storage

PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=320 \
	persist.sys.language=zh \
	persist.sys.country=CN \
	persist.sys.timezone=Asia/Shanghai \
	drm.service.enabled=true \
	ro.telephony.ril.v3=qcomdsds \
	ro.telephony.ril_class=GrandMemoGlobalRIL \
	ro.cdma.home.operator.numeric=46003 \
	ro.cdma.home.operator.alpha=Telecom \
	ro.cdma.subscribe_on_ruim_ready=true \
	ro.telephony.default_network=8 \
	ro.cdma.hasMultiApnSupport=true \
	telephony.lteOnCdmaDevice=1 \
	ril.subscription.types=NV,RUIM

PRODUCT_PROPERTY_OVERRIDES += \
	dalvik.vm.dexopt-cache-only=0 \
	dalvik.vm.dexopt-data-only=1

# Enable AAC 5.1 output
PRODUCT_PROPERTY_OVERRIDES += \
    media.aac_51_output_enabled=true

# Audio configuration
PRODUCT_PROPERTY_OVERRIDES += \
	persist.audio.fluence.mode=endfire \
	persist.audio.vr.enable=false \
	persist.audio.lowlatency.rec=false \
	persist.audio.handset.mic=analog \
	af.resampler.quality=255 \
	mpq.audio.decode=true

# MM modules configuration
PRODUCT_PROPERTY_OVERRIDES += \
	media.stagefright.enable-player=true \
	media.stagefright.enable-http=true \
	media.stagefright.enable-aac=true \
	media.stagefright.enable-qcp=true \
	media.stagefright.enable-fma2dp=true \
	media.stagefright.enable-scan=true \
	mmp.enable.3g2=true

LOCAL_PATH := device/zte/digger

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Camera
PRODUCT_PACKAGES := \
	libgenlock \
	libmmcamera_interface \
	camera-wrapper.msm8960

# Light
PRODUCT_PACKAGES += \
    lights.msm8960

# Increase the HWUI font cache since we have tons of RAM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hwui.text_cache_width=2048

# Audio
PRODUCT_PACKAGES += \
	alsa.msm8960 \
	audio.a2dp.default \
    audio_policy.msm8960 \
	audio.primary.msm8960 \
	audio.usb.default \
	audio.r_submix.default \
	libaudio-resampler

# Power
PRODUCT_PACKAGES += \
	power.msm8960

PRODUCT_PACKAGES += \
	Torch \
	FloatSysPop \
	DeviceSettings

# Charger
PRODUCT_PACKAGES += charger

# STK
PRODUCT_PACKAGES += Stk

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    e2fsck \
    setup_fs

# for bugmailer
PRODUCT_PACKAGES += send_bug
PRODUCT_COPY_FILES += \
    system/extras/bugmailer/bugmailer.sh:system/bin/bugmailer.sh \
    system/extras/bugmailer/send_bug:system/bin/send_bug

# Live Wallpapers
PRODUCT_PACKAGES += \
	LiveWallpapers \
	LiveWallpapersPicker \
	VisualizationWallpapers \
	librs_jni

PRODUCT_PACKAGES += \
	mm-vdec-omx-test \
	mm-venc-omx-test720p \
	libdivxdrmdecrypt \
	libstagefrighthw \
	libc2dcolorconvert \
    libdashplayer

# ramdisk
PRODUCT_COPY_FILES += \
    device/zte/digger/ramdisk/fstab.qcom:root/fstab.qcom \
	device/zte/digger/ramdisk/init.ftm.rc:root/init.ftm.rc \
	device/zte/digger/ramdisk/init.qcom.class_core.sh:root/init.qcom.class_core.sh \
	device/zte/digger/ramdisk/init.qcom.class_main.sh:root/init.qcom.class_main.sh \
	device/zte/digger/ramdisk/init.qcom.rc:root/init.qcom.rc \
    device/zte/digger/ramdisk/init.qcom.sh:root/init.qcom.sh \
	device/zte/digger/ramdisk/init.qcom.usb.rc:root/init.qcom.usb.rc \
	device/zte/digger/ramdisk/init.qcom.usb.sh:root/init.qcom.usb.sh \
    device/zte/digger/ramdisk/init.target.rc:root/init.target.rc\
    device/zte/digger/ramdisk/ueventd.qcom.rc:root/ueventd.qcom.rc

# Prebuilt
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/zte/digger/prebuilt/system,system)

# APN
PRODUCT_COPY_FILES += \
	device/zte/digger/prebuilt/system/etc/apns-conf.xml:system/etc/apns-conf.xml

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:/system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:/system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:/system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:/system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:/system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:/system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:/system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:/system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:/system/etc/permissions/android.hardwardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:/system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:/system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:/system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:/system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:/system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:/system/etc/permissions/android.hardware.compass.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:/system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:/system/etc/permissions/android.hardware.telephony.gsm.xml


# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

$(call inherit-product, build/target/product/full.mk)

$(call inherit-product-if-exists, vendor/zte/digger/digger-vendor.mk)

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=8
PRODUCT_NAME := full_digger
PRODUCT_DEVICE := digger
PRODUCT_MANUFACTURER := ZTE
PRODUCT_MODEL := ZTE Digger
