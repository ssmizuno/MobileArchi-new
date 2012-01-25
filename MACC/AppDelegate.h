//
//  AppDelegate.h
//  MACC
//
//  Created by masashi mizuno on 11/12/08.
//  Copyright (c) 2011年 SSkikaku. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarDelegate> {
    
    NSDictionary *dataDictionary;

}

@property (strong, nonatomic) UIWindow *window;

@property (strong ,nonatomic) UINavigationController *nav;

@property (strong ,nonatomic) UITabBarController *tabBar;

@property (strong, nonatomic) NSDictionary *dataDictionary;


- (void)setNavgationBarStyle:(UINavigationController *)navBar;

@end
