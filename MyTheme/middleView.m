
//
//  middleView.m
//  MyTheme
//
//  Created by 放爷小MAC on 17/1/10.
//  Copyright © 2017年 放爷小MAC. All rights reserved.
//

#import "middleView.h"

#import "ThemeDetailViewController.h"

@implementation middleView
-(id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self initUI];
    
    return self;
}

-(void)initUI{
    _lineView1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-40, 1)];
    _lineView1.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:_lineView1];
    
    _theNewLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 85, 25)];
    _theNewLabel.tintColor = [UIColor blackColor];
    _theNewLabel.font = [UIFont systemFontOfSize:14];
    _theNewLabel.text = @"最新推送";
    [self addSubview:_theNewLabel];
    
    _moreButton = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_lineView1.frame)-60, 0, 75, 25)];
    _moreButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [_moreButton setTintColor:[UIColor blueColor]];
    [_moreButton setTitleColor:[UIColor blueColor] forState:0];
    [_moreButton setTitle:@"更多  >" forState:0];
    [_moreButton addTarget:_controlTarget action:@selector(moreAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_moreButton];
    
    _lineView2 = [[UIView alloc]initWithFrame:CGRectMake(0,20, SCREEN_WIDTH-40, 1)];
    _lineView2.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:_lineView2];
    
}

-(void)moreAction{
    
    [_delegate moreAction];
    NSLog(@"按了");
}
@end
