//
//  normalCell.m
//  MyTheme
//
//  Created by 放爷小MAC on 17/1/8.
//  Copyright © 2017年 放爷小MAC. All rights reserved.
//

#import "normalCell.h"

@implementation normalCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self initUI];
    
    return self;
}

//初始化UI

-(void) initUI{
    _iconImage = [[UIImageView alloc]initWithFrame:CGRectMake(20, 10, 20, 20)];
    [self.contentView addSubview:_iconImage];
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_iconImage.frame)+10,CGRectGetMinY(_iconImage.frame) , rightMenuWith-20-10, 20)];
    _titleLabel.font = normalFont;
    _titleLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:_titleLabel];
}

@end
