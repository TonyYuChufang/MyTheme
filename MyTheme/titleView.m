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
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-10, 40)];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.tintColor = [UIColor blackColor];
    _titleLabel.font = [UIFont systemFontOfSize:20];
    _titleLabel.text = @"MyTheme";
    [self addSubview:_titleLabel];
    
}

@end
