#import "Menu.h"

Menu *menu = [Menu sharedInstance];

@implementation Menu
+ (instancetype)sharedInstance {
    static Menu *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}
- (void)setTitle:(NSString *)title {}
- (void)addSwitch:(NSString *)name description:(NSString *)description toggle:(bool *)toggle {}
- (void)addSlider:(NSString *)name description:(NSString *)description min:(float)min max:(float)max value:(float *)value {}
- (void)addButton:(NSString *)name action:(void (^)(void))action {}
- (void)showMenuButton {}
@end
