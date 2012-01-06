//
//  AppDelegate.h
//  MACC
//
//  Created by masashi mizuno on 11/12/08.
//  Copyright (c) 2011年 SSkikaku. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@class BCTabBarController;

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong ,nonatomic) UINavigationController *nav;

@property (strong ,nonatomic) BCTabBarController *tabBar;

- (void)setNavgationBarStyle:(UINavigationController *)navBar;

@end
