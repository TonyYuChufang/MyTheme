//
//  personViewController.m
//  MyTheme
//
//  Created by 放爷小MAC on 17/1/11.
//  Copyright © 2017年 放爷小MAC. All rights reserved.
//

#import "personViewController.h"
#import "avaterCell.h"
#import "normalCell.h"
#import "titleView.h"
@interface personViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation personViewController
{
    UITableView *_tableView;
    titleView *_titleView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _persondataSource = @[@"用户信息",@"动态",@"收藏"];
    [self initUI];
}
-(void)initUI{
    self.navigationController.navigationBar.subviews[0].alpha = 0;
    //设置标题
//    _titleView = [[titleView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
//    _titleView.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
//    _titleView.titleLabel.textAlignment = NSTextAlignmentCenter;
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 70, 40)];
    [label setTextAlignment:NSTextAlignmentCenter];
    label.text = @"个人中心";
    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    bottomView.layer.shadowColor = [[UIColor blackColor]CGColor];
    bottomView.layer.shadowOffset = CGSizeMake(0, 3);
    [bottomView addSubview:label];
    self.navigationItem.titleView = bottomView;
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [UIView new];
    [_tableView registerClass:[avaterCell class] forCellReuseIdentifier:@"avaterCell"];
    [_tableView registerClass:[normalCell class] forCellReuseIdentifier:@"normalCell"];
    [self.view addSubview:_tableView];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _persondataSource.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == 0){
        return 180;
    }else{
        return 44;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == 0){
        avaterCell *cell = [tableView dequeueReusableCellWithIdentifier:@"avaterCell" forIndexPath:indexPath];
        cell.nameLabel.textColor = [UIColor blackColor];
        cell.nameLabel.text = _persondataSource[indexPath.row];
        if([TUser currentUser]){
            cell.nameLabel.text = [TUser currentUser].username;
        }
        return cell;
    }else{
        normalCell *cell = [tableView dequeueReusableCellWithIdentifier:@"normalCell" forIndexPath:indexPath];
        cell.iconImage.image = [[UIImage imageNamed:[NSString stringWithFormat:@"normal%ld",(long)indexPath.row]] imageWithColor:[UIColor blackColor]];
        cell.titleLabel.textColor = [UIColor blackColor];
        cell.titleLabel.text = _persondataSource[indexPath.row];
        return cell;
    }
}
@end
