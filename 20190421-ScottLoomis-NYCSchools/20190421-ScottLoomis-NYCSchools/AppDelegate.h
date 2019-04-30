//
//  AppDelegate.h
//  Test
//
//  Created by Scott Loomis on 2/2/19.
//  Copyright © 2019 Cloud9. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController* mainNavVC;


@end

//Commit Note:
// I figured it out, Xcode grabs any git hub account associated with the email listed in Preferences -> Source Code -> Author Email field
//In my case it was an old email address associated with an abandoned personal github test account.

