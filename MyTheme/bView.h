//
//  bottomView.h
//  MyTheme
//
//  Created by 放爷小MAC on 17/1/10.
//  Copyright © 2017年 放爷小MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PaperImageView.h"
#import "HomeViewController.h"
@protocol bViewDelegate <NSObject>
-(void)seeThemeDetail;
@end
@class HomeViewController;
@interface bView : UIView
@property (nonatomic,strong) PaperImageView *paperWall1;
@property (nonatomic,strong) PaperImageView *paperWall2;
@property (nonatomic,strong) PaperImageView *paperWall3;
@property (weak, nonatomic) HomeViewController *controlTarget;
@property (nonatomic,weak) id<bViewDelegate>bdelegate;
@end
