include theos/makefiles/common.mk
export GO_EASY_ON_ME=1
TWEAK_NAME = LabelSlide
LabelSlide_FILES = Tweak.xm
LabelSlide_FRAMEWORKS = UIKit
include $(THEOS_MAKE_PATH)/tweak.mk
