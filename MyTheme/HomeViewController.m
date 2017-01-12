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
#import "ThemeDetailViewController.h"
#import "middleView.h"
#import "bView.h"
#import "personViewController.h"
@interface HomeViewController ()<rightMenuViewDelegate,middleViewDelegate>

@end

@implementation HomeViewController
{
    titleView *_titleView;
    rightItem *_rightItem;
    ActivityScrollView *_scrollView;
    middleView *_middleView;
    bView *_bView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

//初始化UI

-(void)initUI{
    self.navigationController.navigationBar.subviews[0].alpha = 1;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:91.0/255.0 green:250.0/255.0 blue:39.0/255.0 alpha:1];
    //设置标题
    
    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.navigationController.navigationBar.frame)-40, SCREEN_WIDTH-40, 40)];
    _titleView = [[titleView alloc]initWithFrame:CGRectMake(0, 4, SCREEN_WIDTH-70, 30)];
    bottomView.layer.shadowColor = [[UIColor blackColor]CGColor];
    bottomView.layer.shadowOffset = CGSizeMake(0, 3);
    [bottomView addSubview:_titleView];
    self.navigationItem.titleView = bottomView;
//    添加rigthItem
    _rightItem = [[rightItem alloc]initRightItemWithTarget:self];
    self.navigationItem.rightBarButtonItem = _rightItem;
    _scrollView = [[ActivityScrollView  alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.navigationController.navigationBar.frame)+5, SCREEN_WIDTH, SCREEN_HEIGHT*0.3)];
    [self.view addSubview:_scrollView];
    
    _middleView = [[middleView alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(_scrollView.frame)+20, SCREEN_WIDTH-40, 30)];
    _middleView.controlTarget = self;
    _middleView.delegate = self;
    [self.view addSubview:_middleView];
    
    _bView = [[bView alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(_middleView.frame), SCREEN_WIDTH-40, SCREEN_HEIGHT*0.4)];
    [self.view addSubview:_bView];
}
#pragma mark - rightMenu Delegate
-(void)modalToLogin{
    [_rightItem hideMenu];
    UIStoryboard *loginSB = [UIStoryboard storyboardWithName:@"LoginSB" bundle:nil];
    LoginViewController *vc = [loginSB instantiateViewControllerWithIdentifier:@"loginVC"];
    [self presentViewController:vc animated:true completion:^{
    
    }];
}
-(void)moreAction{
    ThemeDetailViewController *vc = [[ThemeDetailViewController alloc]init];
    [self.navigationController pushViewController:vc animated:true];
}
-(void)moveToPersonCenter{
    personViewController *vc = [[personViewController alloc]init];
    [self.navigationController pushViewController:vc animated:true];
}

@end
