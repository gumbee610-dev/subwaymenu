#import "Menu.h"

// This is the core engine that makes the menu pop up and buttons work
@implementation Menu
- (instancetype)initWithTitle:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(NSString *)titleFont credits:(NSString *)credits headerColor:(UIColor *)headerColor switchOffColor:(UIColor *)switchOffColor switchOnColor:(UIColor *)switchOnColor switchTitleFont:(NSString *)switchTitleFont switchTitleColor:(UIColor *)switchTitleColor infoButtonColor:(UIColor *)infoButtonColor maxVisibleSwitches:(int)maxVisibleSwitches menuWidth:(CGFloat)menuWidth menuIcon:(NSString *)menuIcon {
    self = [super init];
    return self;
}
@end
