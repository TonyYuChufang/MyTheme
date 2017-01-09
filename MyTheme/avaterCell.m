//
//  TableViewCell.m
//  MyTheme
//
//  Created by yu on 2016/12/18.
//  Copyright © 2016年 放爷小MAC. All rights reserved.
//

#import "avaterCell.h"

@implementation avaterCell

-(id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self initUI];
    
    return self;
}

//初始化UI

-(void) initUI{
    _avater = [[UIImageView alloc]initWithFrame:CGRectMake(15, 80, 70, 70)];
    _avater.layer.cornerRadius =35;
    _avater.layer.masksToBounds = true;
    _avater.layer.borderColor = [[UIColor whiteColor] CGColor];
    _avater.layer.borderWidth = 1;
    _avater.contentMode = UIViewContentModeScaleAspectFill;
    _avater.image = [UIImage imageNamed:@"defaultAvatar"];
    [self.contentView addSubview:_avater];
    
    _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_avater.frame)+5, CGRectGetMinY(_avater.frame)+23
                                                          ,rightMenuWith-CGRectGetWidth(_avater.frame)-10,20)];
    _nameLabel.textColor = [UIColor grayColor];
    _nameLabel.font = normalFont;
    [self.contentView addSubview:_nameLabel];
    
}

@end
