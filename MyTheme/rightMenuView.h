//
//  rightMenuView.h
//  MyTheme
//
//  Created by yu on 2016/12/18.
//  Copyright © 2016年 放爷小MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol rightMenuViewDelegate <NSObject>
-(void)modalToLogin;
-(void)moveToPersonCenter;
@end

@interface rightMenuView : UIView <UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) NSArray *dataSourcet;

@property (nonatomic, weak) id<rightMenuViewDelegate>delegate;
@end
