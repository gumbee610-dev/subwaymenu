export ARCHS = arm64
export TARGET = iphone:clang:latest:14.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SubwayMod
SubwayMod_FILES = tweak.xm
SubwayMod_CFLAGS = -fobjc-arc -Wno-deprecated-declarations
SubwayMod_LDFLAGS = -undefined dynamic_lookup

include $(THEOS_MAKE_PATH)/tweak.mk
