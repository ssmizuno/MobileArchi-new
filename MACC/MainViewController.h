//
//  ViewController.h
//  MACC
//
//  Created by masashi mizuno on 11/12/08.
//  Copyright (c) 2011年 SSkikaku. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JBKenBurnsView.h"

@interface MainViewController : UIViewController {
    KenBurnsView *kenBurns;
}

@property (strong, nonatomic) KenBurnsView *kenBurns;


@end
