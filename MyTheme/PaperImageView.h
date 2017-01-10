//
//  PaperImageView.h
//  MyTheme
//
//  Created by 放爷小MAC on 17/1/10.
//  Copyright © 2017年 放爷小MAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaperImageView : UIView
@property (nonatomic,strong) UIImageView *paperWall;
@property (nonatomic,strong) UILabel *wallNameLabel;
-(void)setImageandTitle:(UIImage *)image title:(NSString *)label;
-(void)setPaperWallimageWithUrl:(NSString *)url;
@end
