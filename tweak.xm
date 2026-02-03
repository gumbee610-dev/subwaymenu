#import <UIKit/UIKit.h>

static bool modsEnabled = false;

// Interfaces for the compiler
@interface CharacterPlayer : NSObject
- (void)setIsInvincible:(BOOL)isInvincible;
- (void)setCollisionEnabled:(BOOL)collisionEnabled;
@end

// 1. THE TOGGLE (2-Finger Long Press)
%hook UIViewController
- (void)viewDidAppear:(BOOL)animated {
    %orig;
    UILongPressGestureRecognizer *toggle = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleModToggle:)];
    toggle.numberOfTouchesRequired = 2;
    [self.view addGestureRecognizer:toggle];
}

%new
- (void)handleModToggle:(UILongPressGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateBegan) {
        modsEnabled = !modsEnabled;
        NSString *status = modsEnabled ? @"Hacks ACTIVE" : @"Hacks DISABLED";
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Subway Mod" message:status preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
    }
}
%end

// 2. UNLIMITED EVERYTHING (Coins, Keys, Boards)
%hook Wallet
- (long long)coins { return modsEnabled ? 999999999 : %orig; }
- (long long)keys { return modsEnabled ? 999999999 : %orig; }
- (int)hoverboards { return modsEnabled ? 999999999 : %orig; }

// Makes every "Buy" button work for free
- (bool)canAfford:(long long)amount { return modsEnabled ? YES : %orig; }
- (bool)canAffordKeys:(long long)amount { return modsEnabled ? YES : %orig; }
@end

// 3. STORE HACK (Free IAP)
%hook StoreHandler
- (bool)isItemPurchased:(id)itemIdentifier { return modsEnabled ? YES : %orig; }
@end

// 4. GAMEPLAY HACKS (God Mode/Jump)
%hook CharacterPlayer
- (void)update {
    %orig;
    if (modsEnabled) {
        [self setIsInvincible:YES];
        [self setCollisionEnabled:NO];
    }
}
%end

%hook CharacterMovement
- (float)jumpVelocity {
    return modsEnabled ? (%orig * 2.0f) : %orig; // Double jump height
}
%end
