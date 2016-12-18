//
//  rightItem.m
//  MyTheme
//
//  Created by yu on 2016/12/18.
//  Copyright © 2016年 放爷小MAC. All rights reserved.
//

#import "rightItem.h"

@implementation rightItem
-(id)initRightItemWithTarget:(HomeViewController *)target{
    self = [super initWithImage:[UIImage imageNamed:@"toolbar-0480"] style:UIBarButtonItemStylePlain target:self action:@selector(clickRightItem)];
    _controlTarget = target;
    return self;
}

-(void)clickRightItem{
    NSLog(@"点击按钮");
}
@end
