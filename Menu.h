#import <vector>
#import <UIKit/UIKit.h>

@interface Menu : UIView
-(id)initWithTitle:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(NSString *)titleFont credits:(NSString *)credits headerColor:(UIColor *)headerColor switchOffColor:(UIColor *)switchOffColor switchOnColor:(UIColor *)switchOnColor switchTitleFont:(NSString *)switchTitleFont switchTitleColor:(UIColor *)switchTitleColor infoButtonColor:(UIColor *)infoButtonColor maxVisibleSwitches:(int)maxVisibleSwitches menuWidth:(CGFloat)menuWidth;
-(void)showMenuButton;
@end

// Dummy classes to stop the "Not Found" errors
@interface OffsetPatcher : UIButton
@end
@interface TextFieldSwitch : UIButton
@end
@interface SliderSwitch : UIButton
@end
