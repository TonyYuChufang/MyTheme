
//
//  XHttp.m
//  MyTheme
//
//  Created by 放爷小MAC on 17/1/10.
//  Copyright © 2017年 放爷小MAC. All rights reserved.
//

#import "XHttp.h"
#import "AFNetworking.h"
@implementation XHttp

+(void)normalDealWithDic:(NSDictionary *)dict{
    NSNumber *code = dict[@"code"];
    if ([code isEqualToNumber:@(HttpSuccess)]) {
        [SVProgressHUD showSuccessWithStatus:dict[@"description"]];
    }else{
        [SVProgressHUD showErrorWithStatus:dict[@"description"]];
    }
}


+(void)POSTMethon:(NSString *)url params:(NSDictionary *)params callBack:(void (^)(NSDictionary *))callBack{
    
    
    AFSecurityPolicy *policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    [policy setAllowInvalidCertificates:YES];
    
    AFHTTPSessionManager *manage = [AFHTTPSessionManager manager];
    [manage setSecurityPolicy:policy];
    manage.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manage POST:[ipAddress addString:url] parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        callBack([responseObject objectWithData]);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSHTTPURLResponse *response = error.userInfo[AFNetworkingOperationFailingURLResponseErrorKey];
        if (response.statusCode == 500) {
            NSDictionary *dict = @{@"code":@(300),@"description":@"服务器内部错误"};
            callBack(dict);
        }else{
            NSDictionary *dict = @{@"code":@(300),@"description":@"无法连接到服务器"};
            callBack(dict);
        }
    }];
}

+(void)GETMethon:(NSString *)url params:(NSDictionary *)params callBack:(void(^)(NSDictionary *infoResult))callBack{
    AFSecurityPolicy *policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    [policy setAllowInvalidCertificates:YES];
    
    AFHTTPSessionManager *manger = [AFHTTPSessionManager manager];
    [manger setSecurityPolicy:policy];
    manger.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manger GET:[ipAddress addString:url] parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        callBack([responseObject objectWithData]);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//                NSHTTPURLResponse *response = error.userInfo[AFNetworkingOperationFailingURLResponseErrorKey];
//        
//                if(response.statusCode == 500){
//                    NSDictionary *dict = @{@"code":@(300),@"description":@"服务器发生错误"};
//                    callBack(dict);
//                }else{
//                    NSDictionary *dict = @{@"code":@(300),@"description":@"无法链接到服务器"};
//                    callBack(dict);
//                }
        NSLog(@"error");
    }];
}
@end
