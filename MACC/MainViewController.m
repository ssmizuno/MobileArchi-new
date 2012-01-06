//
//  ViewController.m
//  MACC
//
//  Created by masashi mizuno on 11/12/08.
//  Copyright (c) 2011年 SSkikaku. All rights reserved.
//

#import "MainViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation MainViewController

@synthesize kenBurns;

//-------------------------------------------------------
//Viewの初期化
//-------------------------------------------------------
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        self.view.backgroundColor = [UIColor clearColor];
        self.title = @"information";
    }
    return self;
}

- (NSString *)iconImageName {
	return @"magnifying-glass.png";
}
#pragma mark -------------------------------------------------------
#pragma mark - View lifecycle
#pragma mark -------------------------------------------------------

//-------------------------------------------------------
//ViewをLoadしたときに呼ばれる
//-------------------------------------------------------
- (void) loadView {
    [super loadView];
    //Slideの実装
    self.kenBurns = [[KenBurnsView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-44)];
    self.kenBurns.backgroundColor = [UIColor clearColor];
    [self.view addSubview:kenBurns];
    
    self.kenBurns.layer.borderWidth = 1;
    self.kenBurns.layer.borderColor = [UIColor clearColor].CGColor;    
    
    NSArray *myImages = [NSArray arrayWithObjects:
                         [UIImage imageNamed:@"01.jpg"],
                         [UIImage imageNamed:@"02.jpg"],
                         [UIImage imageNamed:@"03.jpg"],
                         [UIImage imageNamed:@"04.jpg"],
                         [UIImage imageNamed:@"05.jpg"], nil];
    
    [self.kenBurns animateWithImages:myImages 
                 transitionDuration:5 
                               loop:YES 
                        isLandscape:YES];
    
    //Logo画像
    UIImageView *infoView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"info.png"]];
    infoView.frame = CGRectMake(0, -44, 320, 460);
    [self.view addSubview:infoView];
    
    //バージョン表記
    //バージョン番号取得
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    version = [@"version " stringByAppendingString:version];
    
    UILabel *versionLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 342.0, self.view.frame.size.width, 25.0)];
	versionLabel.text = version;
	versionLabel.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.4];
	versionLabel.textAlignment = UITextAlignmentCenter;
	versionLabel.font = [versionLabel.font fontWithSize:16];
    versionLabel.shadowColor = [UIColor whiteColor];
    versionLabel.shadowOffset = CGSizeMake(0.f, 0.5f);
	[self.view addSubview:versionLabel];
}

//-------------------------------------------------------
//Viewが表示される直前に呼ばれる
//-------------------------------------------------------
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //インジケーターON
    [SVProgressHUD show];
}

//-------------------------------------------------------
//Viewが表示された直後に呼ばれる
//-------------------------------------------------------
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //インジケーターOFF
    [SVProgressHUD dismiss];
    
}

//-------------------------------------------------------
//Viewが非表示される直前に呼ばれる
//-------------------------------------------------------
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}

//-------------------------------------------------------
//Viewが非表示された直後に呼ばれる
//-------------------------------------------------------
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}

//-------------------------------------------------------
//回転対応の有無
//-------------------------------------------------------
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark -------------------------------------------------------
#pragma mark - Memory
#pragma mark -------------------------------------------------------

//-------------------------------------------------------
//メモリリーク時に呼ばれる（インスタンス変数はここでnilにする）
//-------------------------------------------------------

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.kenBurns = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
