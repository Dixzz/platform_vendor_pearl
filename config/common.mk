# Generic product
PRODUCT_NAME := pearl
PRODUCT_BRAND := pearl
PRODUCT_DEVICE := generic

 EXCLUDE_SYSTEMUI_TESTS := true

 # version
include vendor/pearl/config/version.mk

 # Props
include vendor/pearl/config/pearl_props.mk

 # Packages
include vendor/pearl/config/packages.mk

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/pearl/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/pearl/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/pearl/prebuilt/common/bin/50-pearl.sh:system/addon.d/50-pearl.sh \
    vendor/pearl/prebuilt/common/bin/blacklist:system/addon.d/blacklist

ifeq ($(AB_OTA_UPDATER),true)
PRODUCT_COPY_FILES += \
    vendor/pearl/prebuilt/common/bin/backuptool_ab.sh:system/bin/backuptool_ab.sh \
    vendor/pearl/prebuilt/common/bin/backuptool_ab.functions:system/bin/backuptool_ab.functions \
    vendor/pearl/prebuilt/common/bin/backuptool_postinstall.sh:system/bin/backuptool_postinstall.sh
endif

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    vendor/pearl/overlay/common \
    vendor/pearl/overlay/themes

# Bootanimation
$(call inherit-product, vendor/pearl/config/bootanimation.mk)
