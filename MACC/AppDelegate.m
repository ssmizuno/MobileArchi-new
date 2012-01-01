//
//  AppDelegate.m
//  MACC
//
//  Created by masashi mizuno on 11/12/08.
//  Copyright (c) 2011年 SSkikaku. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "BrowserViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;
@synthesize nav = _nav;

- (BOOL)openURL:(NSURL*)url
{
    BrowserViewController *bvc = [[BrowserViewController alloc] initWithUrls:url];
    [self.nav pushViewController:bvc animated:YES];
    
    return YES;
}

//-------------------------------------------------------
//アプリケーションの初期化処理
//-------------------------------------------------------
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.viewController = [[MainViewController alloc] initWithNibName:nil bundle:nil];
    //背景パターンの作成
    UIImage *bgTile = [UIImage imageNamed:@"bg_tile.jpg"];
    self.window.backgroundColor = [UIColor colorWithPatternImage:bgTile];
    //NavigationControllerの追加
    self.nav = [[UINavigationController alloc] initWithRootViewController:self.viewController];
    //ナビゲーションバーの色変更
    self.nav.navigationBar.tintColor = [UIColor colorWithRed:0.651 green:0.565 blue:0.451 alpha:0];
    
    //ナビゲーションバーの背景画像設定
    UIImage *navBgImage = [UIImage imageNamed:@"NavigationBar.png"];
    //iOS5用
    if ([self.nav.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)] ) {
        [self.nav.navigationBar setBackgroundImage:navBgImage forBarMetrics:UIBarMetricsDefault];
    }
    //iOS4.3用
    else {
        UIImageView *navBgImageView = [[UIImageView alloc] initWithImage:navBgImage];
        navBgImageView.frame = self.nav.navigationBar.bounds;
        navBgImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        navBgImageView.layer.zPosition = -FLT_MAX;
        [self.nav.navigationBar insertSubview:navBgImageView atIndex:0];
    }
    
    //MainViewControllerをrootに設定
    self.window.rootViewController = self.nav;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

@end
