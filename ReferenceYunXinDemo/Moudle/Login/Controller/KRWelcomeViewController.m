//
//  KRWelcomeViewController.m
//  ReferenceYunXinDemo
//
//  Created by kairu on 16/12/14.
//  Copyright © 2016年 凯如科技. All rights reserved.
//

#import "KRWelcomeViewController.h"
#import "KRLoginServer.h"
#import "KRTabBarControllerConfig.h"
@interface KRWelcomeViewController ()

@end

@implementation KRWelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self requestData];
}

- (void)requestData
{
    [KRLoginServer setBlockWithSuccessBlock:^(id returnValue) {
        
        [[[[UIApplication sharedApplication] delegate] window] setRootViewController:[KRTabBarControllerConfig new].tabBarController];
    } messageBlock:^(id returnValue) {
        
    } failureBlock:^(id returnValue) {
        if ([returnValue isEqualToString:@"0"]) {
            
            returnValue = @"用户名或密码错误!";
            
            [SVProgressHUD showErrorWithStatus:returnValue];
            
        } else if ([returnValue isEqualToString:@"-1"]) {
            
            [SVProgressHUD showInfoWithStatus:@"当前手机号未注册，请注册后再登录"];
            
        } else {
            
            [SVProgressHUD showErrorWithStatus:returnValue];
            
        }
        UIViewController *loginVC = [[UIStoryboard storyboardWithName:@"KRLoginStoryboard" bundle:nil] instantiateViewControllerWithIdentifier:@"krlogin"];
        [[[[UIApplication sharedApplication] delegate] window] setRootViewController:loginVC];
    }];
    
    [KRLoginServer autoLoginAcount];
    
}

@end
