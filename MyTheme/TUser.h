//
//  TUser.h
//  MyTheme
//
//  Created by 放爷小MAC on 17/1/10.
//  Copyright © 2017年 放爷小MAC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TUser : NSObject
@property (nonatomic,strong) NSString *username;
@property (nonatomic,strong) NSString *userid;

-(void)save;
+(TUser *)currentUser;
@end
