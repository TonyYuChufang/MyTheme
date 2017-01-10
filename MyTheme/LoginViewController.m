//
//  LoginViewController.m
//  MyTheme
//
//  Created by 放爷小MAC on 17/1/9.
//  Copyright © 2017年 放爷小MAC. All rights reserved.
//

#import "LoginViewController.h"
#import "XKeyBoard.h"
#import "RegisterViewController.h"
@interface LoginViewController ()<KeyBoardDlegate>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconImageTopContraint;

@end

@implementation LoginViewController

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
- (IBAction)loginAction:(id)sender {
    NSString *username = _username.text;
    NSString *password = _password.text;
    
    if([username isEqualToString:@""]){
        [SVProgressHUD showErrorWithStatus:@"请输入用户名"];
        return;
    }
    if([password isEqualToString:@""]){
        [SVProgressHUD showErrorWithStatus:@"请输入密码"];
        return;
    }
    WS(wself);
    NSDictionary *params = @{@"nickName":username,@"passWord":password};
    [XHttp POSTMethon:@"/login" params:params callBack:^(NSDictionary *infoResult) {
        NSNumber *code = infoResult[@"code"];
        TUser *user = [TUser new];
        user.username = infoResult[@"nickName"];
        user.userid = infoResult[@"userid"];
        [user save];
        if([code isEqualToNumber:@(HttpSuccess)]){
            [XHttp normalDealWithDic:infoResult];
            [wself dismissViewControllerAnimated:true completion:^{
            }];
            [[NSNotificationCenter defaultCenter]postNotificationName:loginSuccess object:nil];
        }else{
            [XHttp normalDealWithDic:infoResult];
        }
    }];
}
- (IBAction)registerNewUser:(id)sender {
    UIStoryboard *SB = [UIStoryboard storyboardWithName:@"registerSB" bundle:nil];
    RegisterViewController *registerVC = [SB instantiateViewControllerWithIdentifier:@"RegisterVC"];
    
    [self presentViewController:registerVC animated:true completion:^{
        
    }];
}
- (IBAction)forgetPassword:(id)sender {
}

@end
