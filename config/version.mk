# Copyright (C) 2018 PearlOS
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

PEARL_MOD_VERSION = 9.0

ifndef PEARL_BUILD_TYPE
    PEARL_BUILD_TYPE := UNOFFICIAL
endif

ifeq ($(PEARL_BETA),true)
    PEARL_BUILD_TYPE := BETA
endif

ifeq ($(PEARL_ALPHA),true)
    PEARL_BUILD_TYPE := ALPHA
endif

CURRENT_DEVICE=$(shell echo "$(TARGET_PRODUCT)" | cut -d'_' -f 2,3)

ifeq ($(PEARL_OFFICIAL),true)
   LIST = $(shell curl -s https://raw.githubusercontent.com/PearlOS/vendor_pearl/pie/pearl.devices)
   FOUND_DEVICE = $(filter $(CURRENT_DEVICE), $(LIST))
    ifeq ($(FOUND_DEVICE),$(CURRENT_DEVICE))
      IS_OFFICIAL=true
      PEARL_BUILD_TYPE := OFFICIAL
   else
      PEARL_BUILD_TYPE := UNOFFICIAL
   endif
endif

PEARL_BUILD_DATE := $(shell date -u +%Y%m%d-%H%M)
PEARL_BUILD_VERSION := Pearl-$(PEARL_MOD_VERSION)-$(CURRENT_DEVICE)-$(PEARL_BUILD_TYPE)
PEARL_VERSION := Pearl-$(PEARL_MOD_VERSION)-$(CURRENT_DEVICE)-$(PEARL_BUILD_TYPE)-$(PEARL_BUILD_DATE)
ROM_FINGERPRINT := Pearl/$(PEARL_MOD_VERSION)/$(CURRENT_DEVICE)/$(PEARL_BUILD_DATE)
PEARL_DISPLAY_VERSION := Pearl-$(PEARL_MOD_VERSION)-$(CURRENT_DEVICE)-$(PEARL_BUILD_TYPE)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.pearl.build.version=$(PEARL_BUILD_VERSION) \
    ro.pearl.version=$(PEARL_VERSION) \
    ro.pearl.releasetype=$(PEARL_BUILD_TYPE) \
    ro.mod.version=$(PEARL_MOD_VERSION) \
    ro.pearl.display.version=$(PEARL_DISPLAY_VERSION) \
    ro.pearl.fingerprint=$(ROM_FINGERPRINT)
