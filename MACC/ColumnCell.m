//
//  ColumnCell.m
//  MobileArchi
//
//  Created by 水野 真史 on 12/01/06.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ColumnCell.h"

@implementation ColumnCell

@synthesize cellImage, cellLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.cellImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 65.0)];
        [self addSubview:cellImage];
        
        self.cellLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, 10, 200, 50)];
        self.cellLabel.font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
        self.cellLabel.textColor = [UIColor blackColor];
        [self addSubview:cellLabel];
    
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
