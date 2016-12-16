//
//  KRLoginViewController.m
//  ReferenceYunXinDemo
//
//  Created by kairu on 16/12/8.
//  Copyright © 2016年 凯如科技. All rights reserved.
//

#import "KRLoginViewController.h"
#import "KRLoginServer.h"
#import "KRTabBarControllerConfig.h"

@interface KRLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *acountText;
@property (weak, nonatomic) IBOutlet UITextField *pwdText;

@end

@implementation KRLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 登录回调处理.
    [self setblock];
}

- (void)setblock {

    [KRLoginServer setBlockWithSuccessBlock:^(id returnValue) {
        // 成功回调.
        [SVProgressHUD dismiss];
        [[[[UIApplication sharedApplication] delegate] window] setRootViewController:[KRTabBarControllerConfig new].tabBarController];
        
    } messageBlock:^(id returnValue) {
        
         [self dealFailureWith:returnValue];
    } failureBlock:^(id returnValue) {
        [self dealFailureWith:returnValue];
    }];
}

- (void)dealFailureWith:(id)returnValue {

    // 请求失败，
    if ([returnValue isEqualToString:@"0"]) {
        
        returnValue = @"用户名或密码错误!";
        
        [SVProgressHUD showErrorWithStatus:returnValue];
        
    } else if ([returnValue isEqualToString:@"-1"]) {
        
        [SVProgressHUD dismiss];
        [SVProgressHUD showErrorWithStatus:@"账号不存在,如有疑问请联系管理员"];
    } else {
        
        [SVProgressHUD showErrorWithStatus:returnValue];
        
    }
}


/**
 登录
 */
- (IBAction)login:(UIButton *)sender {
    
    [KRLoginServer loginWithAcount:self.acountText.text paswd:self.pwdText.text];
}


@end
