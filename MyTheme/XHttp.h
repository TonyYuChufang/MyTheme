//
//  XHttp.h
//  MyTheme
//
//  Created by 放爷小MAC on 17/1/10.
//  Copyright © 2017年 放爷小MAC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XHttp : NSObject
+(void)normalDealWithDic:(NSDictionary *)dict;

/**
 *  post方法
 *
 *  @param url      请求接口
 *  @param params   请求参数
 *  @param callBack 回调
 */
+(void)POSTMethon:(NSString *)url params:(NSDictionary *)params callBack:(void(^)(NSDictionary *infoResult))callBack;

/**
 *  get方法
 *
 *  @param url      请求接口
 *  @param params   请求参数
 *  @param callBack 回调
 */
+(void)GETMethon:(NSString *)url params:(NSDictionary *)params callBack:(void(^)(NSDictionary *infoResult))callBack;


@end
