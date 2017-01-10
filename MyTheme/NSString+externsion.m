//
//  NSString+externsion.m
//  MyTheme
//
//  Created by 放爷小MAC on 17/1/10.
//  Copyright © 2017年 放爷小MAC. All rights reserved.
//

#import "NSString+externsion.h"

@implementation NSString(externsion)
-(NSString *)addString:(NSString *)str{
    return [NSString stringWithFormat:@"%@%@",self,str];
}
@end
