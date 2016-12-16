//
//  KRDataModel.h
//  SunshineHealthy
//
//  Created by jiwuwang on 16/3/5.
//  Copyright © 2016年 深圳市凯如科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "KRSbModel.h"
#import "KRConfigure.h"
//#import "KRUserModel.h"
//#import "URBAlertView/AlertManager.h"


@interface KRDataModel : NSObject
///初始化一个单例
+ (KRDataModel *)getInstance;

//!记录更新状态
@property(nonatomic, assign, getter=isUpdate) BOOL update;

/// 记录是否自动登录
@property(nonatomic, assign) BOOL       isLogin;

//! 推送通知 token
@property (nonatomic, strong) NSData        *pushToken;

/// phoenNumber
@property(nonatomic, strong) NSString       *phoneNumber;
/// 密码
@property(nonatomic, strong) NSString       *passWord;

/// open_id
@property(nonatomic, strong) NSString       *openID;

/// 记录云信id
@property(nonatomic, strong) NSString       *acc_id;
/// 记录云信token
@property(nonatomic, strong) NSString       *token;
/// 记录云信昵称
@property(nonatomic, strong) NSString       *nim_nickname;

/// uid
@property(nonatomic, strong) NSString       *uid;
/// 定位描述
@property(nonatomic, strong) NSString       *locationString;

///storyboard工具类，用于取得storyboard中的Viewcontroller
//@property(nonatomic, strong) KRSbModel      *sbModel;

//@property(nonatomic, strong) KRUserModel    *currentUser;
///iOS设配 适配配置
@property(nonatomic, strong) KRConfigure    *configure;

/// 弹框工具
//@property(nonatomic, strong) AlertManager   *alertView;

//access_Token
@property (nonatomic, strong) NSString      *access_Token;

@property (nonatomic, assign) BOOL          isReport;

#pragma -- mark 用于配置秀图展示类型
/// 秀图用户uid
@property(nonatomic, strong) NSString       *parentsUid;

#pragma ---mark 配置缓存
/// 秀图标签
@property (nonatomic, strong) NSMutableArray    *weiboTagArray;
/// 公开选项
@property (nonatomic, strong) NSMutableArray    *publicTagArray;
/// 修图显示标签
@property (nonatomic, strong) NSMutableArray    *weiboChooseTags;


- (NSDictionary *)getCurrentUserData;

@end
