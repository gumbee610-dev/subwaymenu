export ARCHS = arm64
export TARGET = iphone:clang:latest:14.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SubwayMod
SubwayMod_FILES = tweak.xm
SubwayMod_CFLAGS = -fobjc-arc

# THIS REDIRECTS THE DYLIB TO LOOK INSIDE THE APP INSTEAD OF THE SYSTEM
SubwayMod_LDFLAGS = -undefined dynamic_lookup -headerpad_max_install_names

include $(THEOS_MAKE_PATH)/tweak.mk

# THIS FORCES THE DYLIB TO BE "PORTABLE"
after-package::
	install_name_tool -change /Library/Frameworks/CydiaSubstrate.framework/CydiaSubstrate @executable_path/Frameworks/CydiaSubstrate.framework/CydiaSubstrate $(THEOS_OBJ_DIR)/SubwayMod.dylib || true
