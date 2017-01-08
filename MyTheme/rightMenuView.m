//
//  rightMenuView.m
//  MyTheme
//
//  Created by yu on 2016/12/18.
//  Copyright © 2016年 放爷小MAC. All rights reserved.
//

#import "rightMenuView.h"
#import "avaterCell.h"
#import "normalCell.h"

@implementation rightMenuView
{
    UITableView *_tableView;
    
    CGFloat selfHeight;
    CGFloat selfWidth;
}
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    selfWidth = frame.size.width;
    selfHeight = frame.size.height;
    _dataSourcet = @[@"登陆／注册",@"个人中心",@"自定义壁纸",@"设置"];
    [self initUI];
    
    return self;
}

// 初始化ui

-(void)initUI{
    self.backgroundColor = [UIColor whiteColor];
    self.layer.shadowColor = [[UIColor blackColor]CGColor];
    self.layer.shadowOffset = CGSizeMake(-3, 0);
    self.layer.shadowRadius = 3;
    self.layer.shadowOpacity = 0.5;
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, selfWidth, selfHeight)];
    [_tableView registerClass:[avaterCell class] forCellReuseIdentifier:@"avaterCell"];
    [_tableView registerClass:[normalCell class] forCellReuseIdentifier:@"normalCell"];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [UIView new];
    [self addSubview:_tableView];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == 0){
        return 180;
    }else{
        return 44;
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataSourcet.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == 0){
        avaterCell *cell = [tableView dequeueReusableCellWithIdentifier:@"avaterCell" forIndexPath:indexPath];
        cell.nameLabel.text = _dataSourcet[indexPath.row];
        return cell;
    }else{
        normalCell *cell = [tableView dequeueReusableCellWithIdentifier:@"normalCell" forIndexPath:indexPath];
        cell.iconImage.image = [[UIImage imageNamed:[NSString stringWithFormat:@"normal%ld",indexPath.row]] imageWithColor:[UIColor grayColor]];
        cell.titleLabel.text = _dataSourcet   [indexPath.row];
        return cell;
    }
}
@end
