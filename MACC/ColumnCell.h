//
//  ColumnCell.h
//  MobileArchi
//
//  Created by 水野 真史 on 12/01/06.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColumnCell : UITableViewCell {
    
    UIImageView *cellImage;
    UILabel *cellLabel;
}

@property (strong, nonatomic) UIImageView *cellImage;
@property (strong, nonatomic) UILabel *cellLabel;

@end
