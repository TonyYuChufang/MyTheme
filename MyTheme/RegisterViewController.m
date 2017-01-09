//
//  RegisterViewController.m
//  MyTheme
//
//  Created by 放爷小MAC on 17/1/10.
//  Copyright © 2017年 放爷小MAC. All rights reserved.
//

#import "RegisterViewController.h"
#import "XKeyBoard.h"
@interface RegisterViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconImageTopContraint;
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [XKeyBoard registerKeyBoardHide:self];
    [XKeyBoard registerKeyBoardShow:self];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:true];
}
-(void)keyboardWillShowNotification:(NSNotification *)notification{
    self.iconImageTopContraint.constant = -200;
    [self.view layoutIfNeeded];
}
-(void)keyboardWillHideNotification:(NSNotification *)notification{
    self.iconImageTopContraint.constant = 50;
    [self.view layoutIfNeeded];
}
- (IBAction)didMiss:(id)sender {
    [self dismissViewControllerAnimated:true completion:^{
        
    }];
}

@end
