## Specify phone tech before including full_phone
$(call inherit-product, vendor/slim/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := mako

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Inherit some common Slim stuff.
$(call inherit-product, vendor/slim/config/common_full_phone.mk)

# Enhanced NFC
$(call inherit-product, vendor/slim/config/nfc_enhanced.mk)

# Inherit device configuration
$(call inherit-product, device/lge/mako/full_mako.mk)

# Inherit device settings
$(call inherit-product, vendor/slim/config/common_nexus.mk)

# Inherit led flash settings
$(call inherit-product, vendor/slim/config/common_ledflash.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := mako
PRODUCT_NAME := slim_mako
PRODUCT_BRAND := Google
PRODUCT_MODEL := Nexus 4
PRODUCT_MANUFACTURER := LGE

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=occam BUILD_FINGERPRINT="google/occam/mako:4.3/JSS15J/573038:user/release-keys" PRIVATE_BUILD_DESC="occam-user 4.3 JSS15J 573038 release-keys"

