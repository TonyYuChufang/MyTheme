//
//  middleView.h
//  MyTheme
//
//  Created by 放爷小MAC on 17/1/10.
//  Copyright © 2017年 放爷小MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol middleViewDelegate <NSObject>
-(void)moreAction;
@end
@class HomeViewController;
@interface middleView : UIView
@property (nonatomic,strong) UILabel *theNewLabel;
@property (nonatomic,strong) UIButton *moreButton;
@property (nonatomic,strong) UIView *lineView1;
@property (nonatomic,strong) UIView *lineView2;
@property (weak, nonatomic) HomeViewController *controlTarget;
@property (nonatomic, weak) id<middleViewDelegate>delegate;
@end
