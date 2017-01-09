//
//  rightItem.m
//  MyTheme
//
//  Created by yu on 2016/12/18.
//  Copyright © 2016年 放爷小MAC. All rights reserved.
//

#import "rightItem.h"

@implementation rightItem
{
    UIWindow *window;
    UIView *layView;
    
    rightMenuView *rightMenu;
}
-(id)initRightItemWithTarget:(HomeViewController *)target{
    self = [super initWithImage:[UIImage imageNamed:@"toolbar-0480"] style:UIBarButtonItemStylePlain target:self action:@selector(clickRightItem)];
    _controlTarget = target;
    [self initUI];
    rightMenu.delegate = _controlTarget;
    return self;
}
//初始化UI

-(void)initUI{
    window = [UIApplication sharedApplication].keyWindow;
    layView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    layView.alpha = 0;
    layView.backgroundColor = [UIColor blackColor];
    [window addSubview:layView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideMenu)];
    [layView addGestureRecognizer:tap];
    
    rightMenu = [[rightMenuView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH, 0, rightMenuWith, SCREEN_HEIGHT)];
    [window addSubview:rightMenu];
    rightMenu.hidden = true;
}
//按钮点击事件
-(void)clickRightItem{
    [self showMenu];
}
//显示菜单
-(void)showMenu{
    rightMenu.hidden = false;
    [UIView animateWithDuration:0.2 animations:^{
        layView.alpha = 0.2;
        [rightMenu moveToX:SCREEN_WIDTH-rightMenuWith];
    }];
}
//隐藏菜单
-(void)hideMenu{
    [UIView animateWithDuration:0.2 animations:^{
        layView.alpha = 0;
        [rightMenu moveToX:SCREEN_WIDTH];
    }completion:^(BOOL finished) {
        rightMenu.hidden = true;
    }];
}
@end
