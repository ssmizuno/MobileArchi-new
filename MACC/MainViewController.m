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
#pragma mark -------------------------------------------------------
#pragma mark - View lifecycle
#pragma mark -------------------------------------------------------

//-------------------------------------------------------
//ViewをLoadしたときに呼ばれる
//-------------------------------------------------------
- (void) loadView {
    [super loadView];
    
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
    
    UIImageView *infoView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"info.png"]];
    infoView.frame = CGRectMake(0, -44, 320, 460);
    [self.view addSubview:infoView];
    
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    version = [@"version " stringByAppendingString:version];
    
    UILabel *versionLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 300, self.view.frame.size.width, 100)];
	versionLabel.text = version;
	versionLabel.backgroundColor = [UIColor clearColor];
	versionLabel.textAlignment = UITextAlignmentCenter;
	versionLabel.font = [versionLabel.font fontWithSize:16];
    versionLabel.shadowColor = [UIColor whiteColor];
    versionLabel.shadowOffset = CGSizeMake(0.f, 0.5f);
	[self.view addSubview:versionLabel];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
