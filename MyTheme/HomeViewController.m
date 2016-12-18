//
//  HomeViewController.m
//  MyTheme
//
//  Created by 放爷小MAC on 16/12/17.
//  Copyright © 2016年 放爷小MAC. All rights reserved.
//

#import "HomeViewController.h"
#import "titleView.h"
#import "rightItem.h"
@interface HomeViewController ()

@end

@implementation HomeViewController
{
    titleView *_titleView;
    rightItem *_rightItem;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

//初始化UI

-(void)initUI{
    self.navigationController.navigationBar.subviews[0].alpha = 0;
    //设置标题
    _titleView = [[titleView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-70, 40)];
    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-40, 40)];
    [bottomView addSubview:_titleView];
    
    self.navigationItem.titleView = bottomView;
//    添加rigthItem
    _rightItem = [[rightItem alloc]initRightItemWithTarget:self];
    self.navigationItem.rightBarButtonItem = _rightItem;
}

@end
