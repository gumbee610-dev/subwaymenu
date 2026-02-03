#import <UIKit/UIKit.h>

@interface Menu : UIView
@property (nonatomic, strong) NSString *title;
+ (instancetype)sharedInstance;
- (void)setTitle:(NSString *)title;
- (void)addSwitch:(NSString *)name description:(NSString *)description toggle:(bool *)toggle;
- (void)addSlider:(NSString *)name description:(NSString *)description min:(float)min max:(float)max value:(float *)value;
- (void)addButton:(NSString *)name action:(void (^)(void))action;
- (void)showMenuButton;
@end

// Creating a global variable for your setupMenu() to use
extern Menu *menu;
