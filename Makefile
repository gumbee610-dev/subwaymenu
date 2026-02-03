export ARCHS = arm64
export TARGET = iphone:clang:latest:14.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SubwayMod

# 1. CHANGED TO .xm
SubwayMod_FILES = tweak.xm Menu.mm
# 2. ADDED C++ FLAGS
SubwayMod_CFLAGS = -fobjc-arc -std=c++11 -stdlib=libc++
SubwayMod_LDFLAGS = -stdlib=libc++

include $(THEOS_MAKE_PATH)/tweak.mk
