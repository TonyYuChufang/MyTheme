//
//  bottomView.m
//  MyTheme
//
//  Created by 放爷小MAC on 17/1/10.
//  Copyright © 2017年 放爷小MAC. All rights reserved.
//

#import "bView.h"

@implementation bView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    [self initUI];
    
    return self;
}

-(void)initUI{

    _paperWall1 = [[PaperImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width/3-5, self.frame.size.height)];    BmobQuery *bquery1 = [[BmobQuery alloc] initWithClassName:@"ImageInfo"];
    [bquery1 getObjectInBackgroundWithId:@"0a9m888H" block:^(BmobObject *object, NSError *error) {
        if (error) {
            NSLog(@"%@",error);
        } else {
            BmobFile *file = (BmobFile*)[object objectForKey:@"imageName"];
            //打印出可以下载的url
            UIImageView *imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(_paperWall1.frame), CGRectGetHeight(_paperWall1.frame)-20)];
            [imageView1 sd_setImageWithURL:[NSURL URLWithString:file.url]];
            [self addSubview:imageView1];
            [_paperWall1 setImageandTitle:imageView1.image title:[object objectForKey:@"wallName"]];
            NSLog(@"%@",file.url);
        }
    }];
    [self addSubview:_paperWall1];
    _paperWall2 = [[PaperImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_paperWall1.frame)+7.5, 0, self.frame.size.width/3-5, self.frame.size.height)];
    BmobQuery *bquery2 = [[BmobQuery alloc] initWithClassName:@"ImageInfo"];
    [bquery2 getObjectInBackgroundWithId:@"qAxXMMMZ" block:^(BmobObject *object, NSError *error) {
        if (error) {
            NSLog(@"%@",error);
        } else {
            BmobFile *file = (BmobFile*)[object objectForKey:@"imageName"];
            //打印出可以下载的url
            UIImageView *imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_paperWall1.frame)+7.5, 0, CGRectGetWidth(_paperWall2.frame), CGRectGetHeight(_paperWall2.frame)-20)];
            [imageView2 sd_setImageWithURL:[NSURL URLWithString:file.url]];
            [self addSubview:imageView2];
            [_paperWall2 setImageandTitle:imageView2.image title:[object objectForKey:@"wallName"]];
            NSLog(@"%@",file.url);
        }
    }];
    [self addSubview:_paperWall2];
    _paperWall3 = [[PaperImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_paperWall2.frame)+7.5, 0, self.frame.size.width/3-5, self.frame.size.height)];
    BmobQuery *bquery3 = [[BmobQuery alloc] initWithClassName:@"ImageInfo"];
    [bquery3 getObjectInBackgroundWithId:@"wFUS1115" block:^(BmobObject *object, NSError *error) {
        if (error) {
            NSLog(@"%@",error);
        } else {
            BmobFile *file = (BmobFile*)[object objectForKey:@"imageName"];
            //打印出可以下载的url
           UIImageView *imageView3 = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_paperWall2.frame)+7.5, 0, CGRectGetWidth(_paperWall3.frame), CGRectGetHeight(_paperWall3.frame)-20)];
            [imageView3 sd_setImageWithURL:[NSURL URLWithString:file.url]];
            [self addSubview:imageView3];
            [_paperWall3 setImageandTitle:imageView3.image title:[object objectForKey:@"wallName"]];
            NSLog(@"%@",file.url);
        }
    }];
    [self addSubview:_paperWall3];
}
@end
