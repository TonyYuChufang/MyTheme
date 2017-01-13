//
//  PaperImageView.m
//  MyTheme
//
//  Created by 放爷小MAC on 17/1/10.
//  Copyright © 2017年 放爷小MAC. All rights reserved.
//

#import "PaperImageView.h"

@implementation PaperImageView
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    [self initUI];
//    self.backgroundColor = [UIColor blackColor];
    return self;
}

-(void)initUI{
    _paperWall = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height-20)];
    _paperWall.userInteractionEnabled = YES;
    _paperWall.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:_paperWall];
    _wallNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMidX(_paperWall.frame)-35, CGRectGetMaxY(_paperWall.frame)+5, 70, 20)];
    _wallNameLabel.font = [UIFont systemFontOfSize:14];
    _wallNameLabel.textColor = [UIColor blueColor];
    _wallNameLabel.text = @"loading...";
    [self addSubview:_wallNameLabel];
    
}
-(void)setImageandTitle:(UIImage *)image title:(NSString *)label{
    _paperWall.image = image;
    _wallNameLabel.text = label;
}
-(void)setPaperWallimageWithUrl:(NSString *)url{
    [_paperWall sd_setImageWithURL:[NSURL URLWithString:url]];
}
@end
