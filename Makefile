export ARCHS = arm64
export TARGET = iphone:clang:latest:14.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SubwayMod
SubwayMod_FILES = tweak.xm
SubwayMod_CFLAGS = -fobjc-arc -std=c++11 -stdlib=libc++

include $(THEOS_MAKE_PATH)/tweak.mk
