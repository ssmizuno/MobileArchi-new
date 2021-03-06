//
//  ColumnViewController.m
//  MACC
//
//  Created by 水野 真史 on 12/01/04.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ColumnViewController.h"


@implementation ColumnViewController

static NSInteger segNum = 0;

//-------------------------------------------------------
//Viewの初期化
//-------------------------------------------------------
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"ArchiColumn";
    }
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}


#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [SVProgressHUD show];
    
    UISegmentedControl *segControl = [[UISegmentedControl alloc] initWithItems:
                                      [NSArray arrayWithObjects:@"トップニュース", @"近代建築の名作", @"ミュージアム巡り", nil]];
    segControl.frame = CGRectMake(0, 0, self.view.frame.size.width-20, 30);
    segControl.segmentedControlStyle = UISegmentedControlStyleBar;
    segControl.selectedSegmentIndex = 0;
    self.navigationItem.titleView = segControl;
    
    [segControl addTarget:self action:@selector(changeSeg:) forControlEvents:UIControlEventValueChanged];
}

- (void)changeSeg:(UISegmentedControl *)seg {
    [SVProgressHUD showWithStatus:@"NowLoading"];
    NSLog(@"セグメントNo.　%d", seg.selectedSegmentIndex);
    segNum = seg.selectedSegmentIndex; 
    [self.tableView reloadData];
    [SVProgressHUD dismiss];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [SVProgressHUD dismiss];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    NSInteger num;
    switch (segNum) {
        case 0:
            num = 4;
            break;
        case 1:
            num = 3;
            break;
        case 2:
            num = 2;
            break;
    }
    return num;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    NSLog(@"テーブル読み込み直し%d", segNum);
    ColumnCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[ColumnCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    UIImage *cellImageView = [UIImage imageNamed:[NSString stringWithFormat:@"0%d.jpg", indexPath.section+segNum]];        
    cell.cellImage.image = cellImageView;
    cell.cellLabel.text = [NSString stringWithFormat:@"%d-%d番目の記事(ニュース)", segNum, indexPath.section+1];
        
    return cell;
}

-(CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 65.0;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%d-- %d", indexPath.section, segNum);

}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

@end
