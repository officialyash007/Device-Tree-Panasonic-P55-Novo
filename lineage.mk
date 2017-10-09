## Specify phone tech before including full_phone

# Release name
PRODUCT_RELEASE_NAME := P55Novo

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/Panasonic/P55Novo/device_P55Novo.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := P55Novo
PRODUCT_NAME := lineage_P55Novo
PRODUCT_BRAND := Panasonic
PRODUCT_MODEL := Panasonic P55 Novo by Shivom Techdroid
PRODUCT_MANUFACTURER := Panasonic
