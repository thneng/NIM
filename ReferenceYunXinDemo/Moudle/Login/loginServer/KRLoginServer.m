//
//  KRLoginServer.m
//  ReferenceYunXinDemo
//
//  Created by kairu on 16/12/8.
//  Copyright © 2016年 凯如科技. All rights reserved.
//

#import "KRLoginServer.h"
#import "NTESService.h"

@interface KRLoginServer ()

/// 请求参数.
@property (nonatomic, strong) NSMutableDictionary *loginParame;

@end

@implementation KRLoginServer

/// 请求参数.
- (NSMutableDictionary *)loginParame
{
    if (!_loginParame) {
        _loginParame = [NSMutableDictionary dictionaryWithDictionary:@{@"access_token": @"6acd2005bb519dfb4d5f9e0d3cb6d760",
                                                                       @"method": @"POST",
                                                                       @"username": @"",
                                                                       @"password": @""}];
    }
    
    
    return _loginParame;
}


/**
 自动登录.
 */
+ (void)autoLoginAcount
{
    // 获取本地用户数据
    NSDictionary *objc = [[KRDataBaseHelp sharedInstance] searchUserWithUid:DATAMODEL.uid];
    
    [self loginWithAcount:objc[@"auth"][@"username"] paswd:objc[@"password"]];
}


/**
 手动登录.
 */
+(void)loginWithAcount:(NSString *) account paswd:(NSString *)psw {

    KRLoginServer *loginServer = [[KRLoginServer alloc] init];
    [loginServer.loginParame setValue:account forKey:@"username"];
    [loginServer.loginParame setValue:psw forKey:@"password"];
    [[KRAFManager shareBaseAFManager] Post:@"authorization" parameters:loginServer.loginParame progress:nil success:^(BOOL sucessful, id objc) {
        
        //教师端用户
        if (![objc[@"auth"][@"role_id"] isEqualToString:@"3"]) {
            self.failureBlock(@"请用教师账号登录");
            return ;
        }
        
        if (!DATAMODEL.isLogin) {
            // 手动登录云信.
            [[[NIMSDK sharedSDK] loginManager] login:objc[@"yxdata"][@"acc_id"] token:objc[@"yxdata"][@"token"] completion:^(NSError *error) {
                
                if (!error) {
//                    [[NTESLogManager sharedManager] setCurrentLoginData:logindata];
                    // 通知更新首页信息数据
                    NSString *FansAndFollowNotification = @"FansAndFollowNotification";
                    [[NSNotificationCenter defaultCenter] postNotificationName:FansAndFollowNotification object:nil];
                
                }else
                {
                    // 云信自动登录
                    [[[NIMSDK sharedSDK] loginManager] autoLogin:objc[@"yxdata"][@"acc_id"]
                                                           token:objc[@"yxdata"][@"token"]];
                    [[NTESServiceManager sharedManager] start];
                    return ;
                }
                
            }];
            
            [[NTESServiceManager sharedManager] start];
        }else
        {
            // 云信自动登录
            [[[NIMSDK sharedSDK] loginManager] autoLogin:objc[@"yxdata"][@"acc_id"]
                                                   token:objc[@"yxdata"][@"token"]];
            [[NTESServiceManager sharedManager] start];
        }
        
        // 记录属性.
        DATAMODEL.isLogin = YES;
        DATAMODEL.uid = objc[@"uid"];
        
        // 保存用户数据.
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:objc];
        [dic setObject:loginServer.loginParame[@"password"] forKey:@"password"];
        // 这里可以完成用户数据的记录，持久化。对数据进行进一步处理
        [[KRDataBaseHelp sharedInstance] executeUpdateWithTableName:KRUserTableName withData:dic SQLType:SQLtypeUpdate baseData:^(BOOL ressult, KRSQLModel *objc) {
            switch (objc.errorCode) {
                case KRErrorCodeInsert:
                    DDLogInfo(@"插入数据库失败%@", objc.errorMessage);
                    break;
                case KRErrorCodeUpdate:
                    DDLogInfo(@"更新数据库失败%@", objc.errorMessage);
                    break;
                default:
                    break;
            }
        }];
        // 记录属性.
        DATAMODEL.isLogin = YES;
        DATAMODEL.uid = objc[@"uid"];
        self.successBlock(objc);
    } message:^(BOOL sucessful, id objc) {
        self.messageInfo(objc);
    } failure:^(BOOL sucessful, id objc) {
        // 请求失败，
        DATAMODEL.isLogin = NO;
        self.failureBlock(objc);
    }];
}

@end
