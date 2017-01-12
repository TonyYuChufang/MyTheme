//
//  titleView.m
//  MyTheme
//
//  Created by yu on 2016/12/18.
//  Copyright © 2016年 放爷小MAC. All rights reserved.
//

#import "titleView.h"

@implementation titleView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    [self initUI];
    return self;
}

//初始化UI
-(void)initUI{
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.frame)-30,SCREEN_WIDTH, 30)];
    _titleLabel.backgroundColor = [UIColor colorWithRed:91.0/255.0 green:250.0/255.0 blue:39.0/255.0 alpha:0];
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.font = [UIFont systemFontOfSize:20];
    _titleLabel.text = @"MyTheme";
    [self addSubview:_titleLabel];
    
}

@end
