//
//  constant.h
//  MyTheme
//
//  Created by 放爷小MAC on 16/12/17.
//  Copyright © 2016年 放爷小MAC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define WS(wself) __weak typeof(self) wself = self

extern NSString * const loginSuccess;

extern CGFloat const rightMenuWith;

extern UIFont * const normalFont;

extern NSString * const ipAddress;

typedef NS_ENUM(NSUInteger, HttpCode){
    HttpError = 300,
    HttpSuccess = 100
};