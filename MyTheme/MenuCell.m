
//
//  MenuCell.m
//  MyTheme
//
//  Created by 放爷小MAC on 17/1/13.
//  Copyright © 2017年 放爷小MAC. All rights reserved.
//

#import "MenuCell.h"

@implementation MenuCell
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, 50);
    [self initUI];
    
    return self;
}
-(void)initUI{
    _iconImage = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/8-15, 10, 30, 30)];
    _iconImage.image = [UIImage imageNamed:@"home1"];
    _iconImage.tintColor = [UIColor colorWithRed:0 green:184.0/255.0 blue:77.0/255.0 alpha:1];
    [self.contentView addSubview:_iconImage];
}
-(void)setHighlighted:(BOOL)highlighted{
    if(highlighted){
        _iconImage.tintColor = [UIColor whiteColor];
    }else{
        _iconImage.tintColor = [UIColor colorWithRed:0 green:184/255.0 blue:77/255.0 alpha:1];
    }
}
-(void)setSelected:(BOOL)selected{
    if(selected){
        _iconImage.tintColor = [UIColor whiteColor];
    }else{
        _iconImage.tintColor = [UIColor colorWithRed:0 green:184/255.0 blue:77/255.0 alpha:1];
    }
}
@end
