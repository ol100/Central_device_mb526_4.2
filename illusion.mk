#
# Copyright (C) 2012 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit device configuration
$(call inherit-product, device/moto/mb526/full_jordan.mk)

## Specify phone tech before including full_phone
$(call inherit-product, vendor/illusion/config/gsm.mk)

# languages
PRODUCT_LOCALES := en_US de_DE en_CA fr_CA fr_FR de_AT de_CH it_IT pl_PL ru_RU es_ES en_ZA fi_FI el_GR iw_IL hi_IN hu_HU in_ID es_US uk_UA

# phone
$(call inherit-product, vendor/illusion/config/common_phone.mk)

DEVICE_PACKAGE_OVERLAYS += device/moto/mb526/overlay

# Bootanimation
PRODUCT_COPY_FILES +=  \
    vendor/illusion/prebuilt/bootanimation/bootanimation.zip:system/media/bootanimation.zip

PRODUCT_NAME := illusion_mb526
PRODUCT_BRAND := motorola
PRODUCT_DEVICE := mb526
PRODUCT_MODEL := MB526
PRODUCT_MANUFACTURER := MOTO
PRODUCT_RELEASE_NAME := mb526
PRODUCT_SFX := umts
PRODUCT_PROPERTY_OVERRIDES += ro.buildzipid=illusion.mb526.$(shell date +%m%d%y).$(shell date +%H%M%S)

UTC_DATE := $(shell date +%s)
DATE := $(shell date +%Y%m%d)

PRODUCT_BUILD_PROP_OVERRIDES += \
   PRODUCT_NAME=${PRODUCT_DEVICE}_${PRODUCT_SFX} \
   BUILD_NUMBER=${DATE} \
   TARGET_DEVICE=${PRODUCT_DEVICE} \
   BUILD_FINGERPRINT=${PRODUCT_BRAND}/${PRODUCT_DEVICE}_${PRODUCT_SFX}/${PRODUCT_DEVICE}:${PLATFORM_VERSION}/${BUILD_ID}/${DATE}:user/release-keys \
   PRIVATE_BUILD_DESC="${PRODUCT_DEVICE}-user ${PLATFORM_VERSION} ${BUILD_ID} ${DATE} release-keys" \
   PRODUCT_BRAND=${PRODUCT_BRAND} \
   BUILD_UTC_DATE= \
   PRODUCT_DEFAULT_LANGUAGE=en \
   PRODUCT_DEFAULT_REGION=US \

# hybrid
PRODUCT_COPY_FILES +=  \
    vendor/illusion/prebuilt/hybrid_hdpi.conf:system/etc/beerbong/properties.conf
