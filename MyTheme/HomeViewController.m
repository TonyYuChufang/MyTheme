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
#import "LoginViewController.h"
#import "ActivityScrollView.h"
@interface HomeViewController ()<rightMenuViewDelegate>

@end

@implementation HomeViewController
{
    titleView *_titleView;
    rightItem *_rightItem;
    ActivityScrollView *_scrollView;
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
    bottomView.layer.shadowColor = [[UIColor blackColor]CGColor];
    bottomView.layer.shadowOffset = CGSizeMake(0, 3);
    [bottomView addSubview:_titleView];
    self.navigationItem.titleView = bottomView;
//    添加rigthItem
    _rightItem = [[rightItem alloc]initRightItemWithTarget:self];
    self.navigationItem.rightBarButtonItem = _rightItem;
    
    _scrollView = [[ActivityScrollView  alloc]initWithFrame:CGRectMake(0, 80, SCREEN_WIDTH, SCREEN_HEIGHT*0.3)];
    [self.view addSubview:_scrollView];
}

@end
