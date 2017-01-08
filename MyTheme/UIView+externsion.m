//
//  UIView+externsion.m
//  MyTheme
//
//  Created by 放爷小MAC on 17/1/8.
//  Copyright © 2017年 放爷小MAC. All rights reserved.
//

#import "UIView+externsion.h"

@implementation UIView(externsion)

-(void)moveToX:(CGFloat)X{
    CGRect rect = self.frame;
    rect.origin.x = X;
    self.frame = rect;
}

@end
