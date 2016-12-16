//
//  KRLoginServer.h
//  ReferenceYunXinDemo
//
//  Created by kairu on 16/12/8.
//  Copyright © 2016年 凯如科技. All rights reserved.
//

#import "KRBaseServer.h"
#import "KRAFManager.h"
@interface KRLoginServer : KRBaseServer
/**
 自动登录.
 */
+ (void)autoLoginAcount;

/**
 手动登录.
 */
+(void)loginWithAcount:(NSString *) account paswd:(NSString *)psw;

@end
