//
//  MenuBar.m
//  MyTheme
//
//  Created by 放爷小MAC on 17/1/13.
//  Copyright © 2017年 放爷小MAC. All rights reserved.
//

#import "MenuBar.h"
#import "MenuCell.h"
@implementation MenuBar
{
    UICollectionView *_collectionView;
    NSString *CellID;
    NSArray *array;
     double height;
}


-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    [self initUI];
    return self;
}

-(void)initUI{
    CellID = @"cellID";
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, CGRectGetHeight(self.frame)) collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
     [_collectionView registerClass:[MenuCell class] forCellWithReuseIdentifier:@"cellID"];
    _collectionView.backgroundColor = [UIColor colorWithRed:91.0/255.0 green:228.0/255.0 blue:39.0/255.0 alpha:1];
    [self addSubview:_collectionView];
    NSIndexPath  *index = [NSIndexPath indexPathForItem:0 inSection:0];
    [_collectionView selectItemAtIndexPath:index animated:false scrollPosition:UICollectionViewScrollPositionLeft];
    _collectionView.contentOffset = CGPointMake(0, 0);
//    _collectionView.scrollEnabled = NO;
    array = @[@"home142", @"seo12", @"paint64", @"account"];
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 4;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(SCREEN_WIDTH/4, 50);
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    array = @[@"home142", @"seo12", @"paint64", @"account"];
    MenuCell *cell = [_collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
    cell.iconImage.image = [[UIImage imageNamed:array[indexPath.row]] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    cell.backgroundColor = [UIColor colorWithRed:91/255.0 green:228/255.0 blue:39/255.0 alpha:1];
    cell.layer.borderColor=[UIColor darkGrayColor].CGColor;
    cell.layer.borderWidth=0.3;
    return cell;
}
@end
