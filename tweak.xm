#import <UIKit/UIKit.h>
#import "Menu.h" // This is the template header

// Variables for the menu toggles
bool godMode = false;
bool noclip = false;
float jumpHeight = 1.0f;

// Hooking the Player for God Mode/Noclip
%hook CharacterPlayer
- (void)update {
    %orig;
    if (godMode) {
        [self setIsInvincible:YES];
    }
    if (noclip) {
        [self setCollisionEnabled:NO];
    }
}
%end

// Hooking Jump Height
%hook CharacterMovement
- (float)jumpVelocity {
    if (jumpHeight > 1.0f) {
        return %orig * jumpHeight; 
    }
    return %orig;
}
%end

// Hooking Free Shopping
%hook Wallet
- (bool)canAfford:(long long)amount {
    return YES; // Always say yes to buying stuff
}
%end

// Setting up the Menu
void setupMenu() {
    [menu setTitle:@"Subway Mod Menu"];
    [menu addSwitch:@"God Mode" description:@"Never die" toggle:&godMode];
    [menu addSwitch:@"Noclip" description:@"Walk through walls" toggle:&noclip];
    [menu addSlider:@"Jump Height" description:@"Set your boost" min:1.0 max:10.0 value:&jumpHeight];
    [menu addButton:@"Unlock All Characters" action:^{
        // Future code for SpongeBob goes here
    }];
}

%ctor {
    setupMenu();
}
