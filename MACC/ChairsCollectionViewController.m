//
//  ChairsCollectionViewController.m
//  MACC
//
//  Created by masashi mizuno on 11/12/08.
//  Copyright (c) 2011年 SSkikaku. All rights reserved.
//

#import "ChairsCollectionViewController.h"
#import "iCarousel.h"

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#define NUMBER_OF_ITEMS (IS_IPAD? 19: 12)
#define NUMBER_OF_VISIBLE_ITEMS (IS_IPAD? 19: 7)
#define ITEM_SPACING 210
#define INCLUDE_PLACEHOLDERS YES

//-------------------------------------------------------
//Carouselのカテゴリ追加
//-------------------------------------------------------
@interface ChairsCollectionViewController () <iCarouselDataSource, iCarouselDelegate>

@property (nonatomic, strong) iCarousel *carousel;
@property (nonatomic, strong) UINavigationItem *navItem;
@property (nonatomic, assign) BOOL wrap;
@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation ChairsCollectionViewController

@synthesize carousel, navItem, wrap, items;

//-------------------------------------------------------
//Viewの初期化
//-------------------------------------------------------
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"ChairsCollection";
        
        //set up data
        self.items = [NSMutableArray array];
        for (int i = 0; i < NUMBER_OF_ITEMS; i++)
        {
            [items addObject:[NSNumber numberWithInt:i]];
        }
        
        wrap = YES;
    }
    return self;
}

#pragma mark -------------------------------------------------------
#pragma mark - View lifecycle
#pragma mark -------------------------------------------------------

- (void)loadView {
    [super loadView];
    
    //create carousel
	self.carousel = [[iCarousel alloc] initWithFrame:self.view.bounds];
	carousel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    carousel.type = iCarouselTypeCoverFlow2;
	carousel.delegate = self;
	carousel.dataSource = self;
    
	//add carousel to view
	[self.view addSubview:carousel];
}
#pragma mark -------------------------------------------------------
#pragma mark iCarousel methods 
#pragma mark -------------------------------------------------------

- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return [items count];
}

- (NSUInteger)numberOfVisibleItemsInCarousel:(iCarousel *)carousel
{
    //limit the number of items views loaded concurrently (for performance reasons)
    return NUMBER_OF_VISIBLE_ITEMS;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index
{
    //create a numbered view
	UIView *view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"page.png"]];
    UIButton *viewButton = [UIButton buttonWithType:UIButtonTypeCustom];
    viewButton.frame = CGRectMake(20.0, 90.0, 200.0, 200.0);
    viewButton.backgroundColor = [UIColor clearColor];
    viewButton.tag = index;
    [viewButton addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:viewButton];
	return view;
}

- (void)action:(id)sender {
    NSLog(@"おした%d", [sender tag]);
}

- (NSUInteger)numberOfPlaceholdersInCarousel:(iCarousel *)carousel
{
	//note: placeholder views are only displayed if wrapping is disabled
	return INCLUDE_PLACEHOLDERS? 2: 0;
}

- (UIView *)carousel:(iCarousel *)carousel placeholderViewAtIndex:(NSUInteger)index
{
	//create a placeholder view
	UIView *view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"page.png"]];
	return view;
}

- (CGFloat)carouselItemWidth:(iCarousel *)carousel
{
    //slightly wider than item view
    return ITEM_SPACING;
}

- (CATransform3D)carousel:(iCarousel *)_carousel transformForItemView:(UIView *)view withOffset:(CGFloat)offset
{
    //implement 'flip3D' style carousel
    
    //set opacity based on distance from camera
    view.alpha = 1.0 - fminf(fmaxf(offset, 0.0), 1.0);
    
    //do 3d transform
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = self.carousel.perspective;
    transform = CATransform3DRotate(transform, M_PI / 8.0, 0, 1.0, 0);
    return CATransform3DTranslate(transform, 0.0, 0.0, offset * carousel.itemWidth);
}

- (BOOL)carouselShouldWrap:(iCarousel *)carousel
{
    //wrap all carousels
    return wrap;
}

#pragma mark -------------------------------------------------------
#pragma mark - Memory Sycle
#pragma mark -------------------------------------------------------

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.carousel = nil;
    self.navItem = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

@end
