//
//  TUser.m
//  MyTheme
//
//  Created by 放爷小MAC on 17/1/10.
//  Copyright © 2017年 放爷小MAC. All rights reserved.
//

#import "TUser.h"

@implementation TUser
//-(void)save{
//    NSDictionary *dict = @{@"username":_username,@"userid":_userid};
//    NSString *filePath = [NSHomeDirectory() addString:@"/Documents/user.data"];
//    BOOL flag=[NSKeyedArchiver archiveRootObject:dict toFile:filePath];
//    if(flag){
//        NSLog(@"保存成功");
//    }else{
//        NSLog(@"保存失败");
//    }
//}
//-(TUser *)currentUser{
//    NSString *filePath = [NSHomeDirectory() addString:@"/Documents/user.data"];
//    NSDictionary *dict = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
//    
//    TUser *user = [TUser new];
//    user.username = dict[@"username"];
//    user.userid = dict[@"userid"];
//    
//    return user;
//}
-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:_username forKey:@"username"];
    [aCoder encodeObject:_userid forKey:@"userid"];
}
-(id)initWithCoder:(NSCoder *)aDecoder{
    if(self = [super init]){
        _username = [aDecoder decodeObjectForKey:@"username"];
        _userid = [aDecoder decodeObjectForKey:@"userid"];
    }
    return self;
}
-(id)copyWithZone:(NSZone *)zone{
    TUser *copy = [[[self class]allocWithZone:zone]init];
    copy.username = [self.username copyWithZone:zone];
    copy.userid = [self.userid copyWithZone:zone];
    
    return copy;
}
-(void)save{
    NSMutableData *data = [[NSMutableData alloc]init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    [archiver encodeObject:self forKey:@"TUser"];
    [archiver finishEncoding];
  
    NSString *filePath = [NSHomeDirectory() addString:@"/Documents/user.data"];
    [data writeToFile:filePath atomically:true];
}
+(TUser *)currentUser{
    NSString *filePath = [NSHomeDirectory() addString:@"/Documents/user.data"];
    NSData *data = [[NSData alloc]initWithContentsOfFile:filePath];
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc]initForReadingWithData:data];
    
    TUser *user = [unarchiver decodeObjectForKey:@"TUser"];
    [unarchiver finishDecoding];
    return user;
}
@end
