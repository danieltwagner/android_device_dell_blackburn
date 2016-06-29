# Release name
PRODUCT_RELEASE_NAME := blackburn

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/dell/blackburn/device_blackburn.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := blackburn
PRODUCT_NAME := cm_blackburn
PRODUCT_BRAND := dell
PRODUCT_MODEL := blackburn
PRODUCT_MANUFACTURER := dell
