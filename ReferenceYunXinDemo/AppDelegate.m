//
//  AppDelegate.m
//  ReferenceYunXinDemo
//
//  Created by kairu on 16/12/7.
//  Copyright © 2016年 凯如科技. All rights reserved.
//

#import "AppDelegate.h"
#import "KRTabBarControllerConfig.h"
#import "CYLPlusButtonSubclass.h"
#import "KRLoginViewController.h"
// 云信相关
#import "NTESLoginManager.h"
#import "NTESService.h"
#import "NTESClientUtil.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

NSString *NTESNotificationLogout = @"NTESNotificationLogout";

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch
    
    // 注册云信.
    [self setupYunXin];
    
    // 设置主窗口.
    [self setMainRootVC];
    
    // 设置云信登录代理,注销监听.
    [self commonInitListenEvents];
    
    return YES;
}


/**
 注册云信.
 */
- (void)setupYunXin {
    
    [[NIMSDK sharedSDK] registerWithAppID:kNIMAppKey
                                  cerName:kNIMAppCer];
    
}


/**
 设置主窗口.
 */
- (void)setMainRootVC {
    
    // TODO:测试
//    [[[NIMSDK sharedSDK] loginManager] login:@"kr0520700895" token:@"8531d7cb444e9df659d51bb95cebb43d" completion:^(NSError * _Nullable error) {
//    }];

    // 注册加号按钮.
    [CYLPlusButtonSubclass registerPlusButton];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"KRLoginStoryboard" bundle:nil];
    // 判断是否登录.
    if (DATAMODEL.isLogin) {
        
        self.window.rootViewController = [sb instantiateViewControllerWithIdentifier:@"welcomeVC"];
    }else {
    
        self.window.rootViewController = [sb instantiateViewControllerWithIdentifier:@"krlogin"];
    }

    [self.window makeKeyAndVisible];
}


#pragma mark - 设置云信登录代理,注销监听.
- (void)commonInitListenEvents
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(logout)
                                                 name:NTESNotificationLogout
                                               object:nil];
    
    [[[NIMSDK sharedSDK] loginManager] addDelegate:(id)self];
}

- (void)logout
{
    [[NTESLoginManager sharedManager] setCurrentLoginData:nil];
    [[NTESServiceManager sharedManager] destory];

    DATAMODEL.isLogin = NO;
    self.window.rootViewController = [[UIStoryboard storyboardWithName:@"KRLoginStoryboard" bundle:nil] instantiateViewControllerWithIdentifier:@"krlogin"];
}

#pragma NIMLoginManagerDelegate
-(void)onKick:(NIMKickReason)code clientType:(NIMLoginClientType)clientType
{
    NSString *reason = @"你被踢下线";
    switch (code) {
        case NIMKickReasonByClient:
        case NIMKickReasonByClientManually:{
            NSString *clientName = [NTESClientUtil clientName:clientType];
            reason = clientName.length ? [NSString stringWithFormat:@"你的帐号被%@端踢出下线，请注意帐号信息安全",clientName] : @"你的帐号被踢出下线，请注意帐号信息安全";
            break;
        }
        case NIMKickReasonByServer:
            reason = @"你被服务器踢下线";
            break;
        default:
            break;
    }
    [[[NIMSDK sharedSDK] loginManager] logout:^(NSError *error) {
        [[NSNotificationCenter defaultCenter] postNotificationName:NTESNotificationLogout object:nil];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"下线通知" message:reason delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }];
}

- (void)onAutoLoginFailed:(NSError *)error
{
    //添加密码出错等引起的自动登录错误处理
    if ([error code] == NIMRemoteErrorCodeInvalidPass ||
        [error code] == NIMRemoteErrorCodeExist)
    {
        [[[NIMSDK sharedSDK] loginManager] logout:^(NSError *error) {
            [[NSNotificationCenter defaultCenter] postNotificationName:NTESNotificationLogout object:nil];
        }];
    }
}


@end
