export ARCHS = arm64
export TARGET = iphone:clang:latest:14.0

# THIS IS THE KEY FOR NON-JAILBROKEN IPADS
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SubwayMod
SubwayMod_FILES = tweak.xm
SubwayMod_CFLAGS = -fobjc-arc
# FORCE THE COMPILER TO EMBED THE HOOKING ENGINE
SubwayMod_LDFLAGS = -undefined dynamic_lookup

include $(THEOS_MAKE_PATH)/tweak.mk
