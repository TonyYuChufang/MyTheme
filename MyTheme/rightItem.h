//
//  rightItem.h
//  MyTheme
//
//  Created by yu on 2016/12/18.
//  Copyright © 2016年 放爷小MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "rightMenuView.h"

@class HomeViewController;

@interface rightItem : UIBarButtonItem

@property (weak, nonatomic) HomeViewController *controlTarget;

-(id)initRightItemWithTarget:(HomeViewController *)target;

-(void)hideMenu;
@end
