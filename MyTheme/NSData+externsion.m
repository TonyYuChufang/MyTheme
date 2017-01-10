//
//  NSData+externsion.m
//  MyTheme
//
//  Created by 放爷小MAC on 17/1/10.
//  Copyright © 2017年 放爷小MAC. All rights reserved.
//

#import "NSData+externsion.h"

@implementation NSData(externsion)
-(NSDictionary *)objectWithData{
    NSError *error;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:self options:NSJSONReadingMutableContainers error:&error];
    
    return json;
}
@end
