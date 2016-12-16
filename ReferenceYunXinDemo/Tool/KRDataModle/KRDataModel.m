//
//  KRDataModel.m
//  SunshineHealthy
//
//  Created by jiwuwang on 16/3/5.
//  Copyright © 2016年 深圳市凯如科技有限公司. All rights reserved.
//

#import "KRDataModel.h"
#import "KRDataBaseHelp.h"

@implementation KRDataModel

static KRDataModel *_gInstance = nil;

+ (KRDataModel *)getInstance{
    //初始化一个只执行一次的线程
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _gInstance = [[self alloc] init];
        
//        _gInstance.sbModel = [[KRSbModel alloc] init];
        
        _gInstance.configure = [KRConfigure shareConfigure];
        
        _gInstance.uid = [[NSUserDefaults standardUserDefaults] objectForKey:@"uid"];
        _gInstance.isLogin = [[[NSUserDefaults standardUserDefaults] objectForKey:@"isLogin"] boolValue];
        _gInstance.acc_id = @"";
        
        _gInstance.passWord = @"";
        _gInstance.phoneNumber = @"";

        _gInstance.locationString = @"";
        
        _gInstance.update = NO;

    });
    
    return _gInstance;
}


/// 获取当前用户信息
- (NSDictionary *)getCurrentUserData
{
    
    NSDictionary *objc = [[KRDataBaseHelp sharedInstance] searchUserWithUid:self.uid];
    
    return objc;
}

//- (KRUserModel *)currentUser
//{
//    if (!_currentUser) {
//        _currentUser = [KRUserModel instanceModelWithDictionary:self.getCurrentUserData];
//    }
//    
//    return _currentUser;
//}


#pragma mark ---- 默认值
- (NSString *)openID
{
    if (!_openID) {
        _openID = @"";
    }
    
    return _openID;
}

- (NSString *)uid
{
    if (!_uid) {
        _uid = @"";
    }
    
    return _uid;
}

- (NSString *)access_Token{
    
    if (!_access_Token) {
        _access_Token = @"6acd2005bb519dfb4d5f9e0d3cb6d760";
    }
    
    return _access_Token;
}

- (void)setIsLogin:(BOOL)isLogin
{
    _isLogin = isLogin;
    NSString *uid = @"";
    if (_isLogin) {
        
         uid = self.uid;
        
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:_isLogin] forKey:@"isLogin"];
    [[NSUserDefaults standardUserDefaults] setObject:uid forKey:@"uid"];
}

//- (AlertManager *)alertView
//{
//    if (!_alertView) {
//        _alertView = [[AlertManager alloc] init];
//    }
//    
//    return _alertView;
//}

- (NSMutableArray *)weiboTagArray
{
    if (!_weiboTagArray) {
        _weiboTagArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _weiboTagArray;
}

- (NSMutableArray *)weiboChooseTags
{
    if (!_weiboChooseTags) {
        _weiboChooseTags = [NSMutableArray arrayWithCapacity:0];
    }
    
    return _weiboChooseTags;
}

- (NSMutableArray *)publicTagArray
{
    if (!_publicTagArray) {
        _publicTagArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _publicTagArray;
}

@end
