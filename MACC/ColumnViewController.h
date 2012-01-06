//
//  ColumnViewController.h
//  MACC
//
//  Created by 水野 真史 on 12/01/04.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColumnCell.h"

@interface ColumnViewController : UITableViewController<UITableViewDataSource, UITableViewDelegate>

- (void)changeSeg:(UISegmentedControl *)seg;

@end
