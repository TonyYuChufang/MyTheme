//
//  ThemeDetailViewController.h
//  MyTheme
//
//  Created by 放爷小MAC on 17/1/10.
//  Copyright © 2017年 放爷小MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Theme.h"
@interface ThemeDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *themeName;
@property (weak, nonatomic) IBOutlet UILabel *themeSize;
@property (weak, nonatomic) IBOutlet UIImageView *hotImage;
@property (weak, nonatomic) IBOutlet UILabel *desginer;
@property (weak, nonatomic) IBOutlet UILabel *download;
@property (weak, nonatomic) IBOutlet UIView *paperDisplay;

@end
