//
//  ActivityScrollView.m
//  MyTheme
//
//  Created by 放爷小MAC on 17/1/10.
//  Copyright © 2017年 放爷小MAC. All rights reserved.
//

#import "ActivityScrollView.h"

@implementation ActivityScrollView
{
    WSWScrollView *_scrollView;
    
}
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    [self initUI];
    return self;
}
-(void)initUI{
    _scrollView = [[WSWScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT*0.3) andScrollViewMode:ScrollWithDefault];
    _scrollView.timeInterval = 2.f;
    //给自己上两个代理
    _scrollView.dataSource = self;
    _scrollView.delegate = self;
    //添加带父视图上
    [self addSubview:_scrollView];
    
}
#pragma mark - WSWScrollViewDataSource -
//实现协议,这个是必须的,就是传递一个图片数组,本地的就直接上传文件字符串名,网络就穿字符串链接地址.
- (NSArray *)imagesArrayForWSWScrollView:(WSWScrollView *)scrollView
{
    //#if   1是网络图片,0是本地图片(你可以手动更改试一试);
#if 1
    __block NSMutableString *str1 = [[NSMutableString alloc]init];
    __block NSMutableString *str2 = [[NSMutableString alloc]init];
    __block NSMutableString *str3 = [[NSMutableString alloc]init];
    BmobQuery *bquery = [[BmobQuery alloc] initWithClassName:@"ActivityInfo"];
    [bquery findObjectsInBackgroundWithBlock:^(NSArray *array1, NSError *error) {
        NSInteger count = 1;
        for (BmobObject *obj in array1) {
            [obj objectForKey:@"activityImage"];
            BmobFile *file = (BmobFile*)[obj objectForKey:@"activityImage"];
            
            if(count == 1)[str1 setString:file.url];
            if(count == 2)[str2 setString:file.url];
            if(count == 3)[str3 setString:file.url];
            
            count = count + 1;
            NSLog(@" str1=%@\n",str1);
            NSLog(@"imageUrl= %@", file.url);
        }
    }];
    NSArray *array = @[
                       str1,
                       str2,
                       str3
                       ];
    NSLog(@"%@ ,%@, %@ ",str3,str2,str1);
#else
    NSArray *array = @[
                       @"火影01",
                       @"火影02",
                       @"火影03",
                       @"火影04",
                       ];
#endif
    return array;
}

//如果选择模式三,一定要提供中间图片的frame
-(CGRect)scrollViewWithThreePagesCenterItemFrameForWSWScrollView:(WSWScrollView *)scrollView
{
    CGRect frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width - 100, [UIScreen mainScreen].bounds.size.height);
    return frame;
}
#pragma mark - 点击事件
- (void)wswScroView:(WSWScrollView *)scrollView didSelectRowAtIndexPath:(NSInteger)index{
    if (index == 1) {
        NSLog(@"--->我点的这是第%ld张图片",(long)index);
    }
}
@end
