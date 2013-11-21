## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/zte/digger/digger.mk)

# Correct boot animation size for the screen.
TARGET_BOOTANIMATION_NAME := vertical-720x1080

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := digger
PRODUCT_NAME := cm_digger
PRODUCT_BRAND := ZTE
PRODUCT_MODEL := ZTE Digger
PRODUCT_MANUFACTURER := ZTE
PRODUCT_RELEASE_NAME := ZTE Digger

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=digger BUILD_ID=JRO03C BUILD_FINGERPRINT=ZTE/N5_JB4_2/digger:4.2/JOP40C/20130430.110335:user/release-keys PRIVATE_BUILD_DESC="N5_JB4_2-user 4.2 JOP40C 20130430.110335 release-keys" BUILD_NUMBER=20130430.110335
