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
- (IBAction)registerAction:(id)sender {
    NSString *Name = _userName.text;
    NSString *pwd1 = _password.text;
    NSString *pwd2 = _password2.text;
    
    if([Name isEqualToString:@""]){
        [SVProgressHUD showErrorWithStatus:@"请输入用户名"];
        return;
    }
    if([pwd1 isEqualToString:@""]){
        [SVProgressHUD showErrorWithStatus:@"请输入密码"];
        return;
    }
    if([pwd2 isEqualToString:@""]){
      [SVProgressHUD showErrorWithStatus:@"请确认密码"];
        return;
    }
    if(![pwd1 isEqualToString:pwd2]){
        [SVProgressHUD showErrorWithStatus:@"两次密码输入不一致"];
        
        return;
    }
//    __weak RegisterViewController *wself = self;
    WS(wself);
    NSDictionary *params = @{@"nickName":Name,@"passWord":pwd1};
    [XHttp POSTMethon:@"/register" params:params callBack:^(NSDictionary *infoResult) {
        NSNumber *code = infoResult[@"code"];
        if([code isEqualToNumber:@(HttpSuccess)]){
            [SVProgressHUD showSuccessWithStatus:infoResult[@"description"]];
            [wself dismissViewControllerAnimated:true completion:^{
            }];
        }else{
            NSLog(@"error");
            [XHttp normalDealWithDic:infoResult];
        }
    }];
}

@end





















