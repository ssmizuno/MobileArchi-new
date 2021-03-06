//
//  AppDelegate.m
//  MACC
//
//  Created by masashi mizuno on 11/12/08.
//  Copyright (c) 2011年 SSkikaku. All rights reserved.
//

#import "AppDelegate.h"
#import "NSURLConnection+Blocks.h"
#import "MainViewController.h"
#import "ColumnViewController.h"
#import "ChairsCollectionViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize nav = _nav;
@synthesize tabBar = _tabBar;

@synthesize dataDictionary = _dataDictionary;

//-------------------------------------------------------
//アプリケーションの初期化処理
//-------------------------------------------------------
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //-------------------------------------------------------
    //Windowの初期化
    //-------------------------------------------------------
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //-------------------------------------------------------
    //TabBar用のViewControllerを追加
    //-------------------------------------------------------
    
    //viewController01
    MainViewController *mainView = [[MainViewController alloc] initWithNibName:nil bundle:nil];
    UINavigationController *view01 = [[UINavigationController alloc] initWithNibName:nil bundle:nil];
    [view01 pushViewController:mainView animated:NO];
    [self setNavgationBarStyle:view01];
    
    //viewController02
    ColumnViewController *columnView = [[ColumnViewController alloc] initWithNibName:nil bundle:nil];    
    UINavigationController *view02 = [[UINavigationController alloc] initWithNibName:nil bundle:nil];
    [view02 pushViewController:columnView animated:NO];
    [self setNavgationBarStyle:view02];
    
    //viewController03
    ChairsCollectionViewController *chairsView = [[ChairsCollectionViewController alloc] initWithNibName:nil bundle:nil];    
    UINavigationController *view03 = [[UINavigationController alloc] initWithNibName:nil bundle:nil];
    [view03 pushViewController:chairsView animated:NO];
    [self setNavgationBarStyle:view03];
    
    //tabbarの作成
    self.tabBar = [[UITabBarController alloc] initWithNibName:nil bundle:nil];
    [self.tabBar setViewControllers:[NSArray arrayWithObjects:view01, view02, view03, nil]];
     
    //背景パターンの作成
    UIImage *bgTile = [UIImage imageNamed:@"bg_tile.jpg"];
    self.window.backgroundColor = [UIColor colorWithPatternImage:bgTile];   
    
    //MainViewControllerをrootに設定
    [self.window addSubview:self.tabBar.view];
    self.window.rootViewController = self.nav;
    [self.window makeKeyAndVisible];
    return YES;
}

//-------------------------------------------------------
//NavigationBarのstyle変更
//-------------------------------------------------------
- (void)setNavgationBarStyle:(UINavigationController *)navBar {
    //ナビゲーションバーの色変更
    navBar.navigationBar.tintColor = [UIColor colorWithRed:0.651 green:0.565 blue:0.451 alpha:0];
    
    //ナビゲーションバーの背景画像設定
    UIImage *navBgImage = [UIImage imageNamed:@"NavigationBar.png"];
    //iOS5用
    if ([navBar.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)] ) {
        [navBar.navigationBar setBackgroundImage:navBgImage forBarMetrics:UIBarMetricsDefault];
    }
    //iOS4.3用
    else {
        UIImageView *navBgImageView = [[UIImageView alloc] initWithImage:navBgImage];
        navBgImageView.frame = navBar.navigationBar.bounds;
        navBgImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        navBgImageView.layer.zPosition = -FLT_MAX;
        [navBar.navigationBar insertSubview:navBgImageView atIndex:0];
    }
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"アプリ起動");
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

@end
