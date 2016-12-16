//
//  KRBaseModel.m
//  网络封装Demo
//
//  Created by kairu on 16/8/25.
//  Copyright © 2016年 kairu. All rights reserved.
//

#import "KRBaseServer.h"

KRBaseServer *baseServer;

@interface KRBaseServer ()
/// 进度值的回调.
@property (nonatomic, copy) ProgressBlock progressBlock;
/// 数据成功返回回调
@property (nonatomic, copy) ReturnValueBlock successBlock;
/// 失败返回回调
@property (nonatomic, copy) ReturnValueBlock failureBlock;
/// 提示语回调
@property (nonatomic, copy) ReturnValueBlock messageInfo;
@end

@implementation KRBaseServer

+ (ProgressBlock)progressBlock {
    
    return baseServer.progressBlock;
}

+ (ReturnValueBlock)successBlock {
    
    return baseServer.successBlock;
}

+ (ReturnValueBlock)messageInfo {
    
    return baseServer.messageInfo;
}

+ (ReturnValueBlock)failureBlock {
    
    return baseServer.failureBlock;
}

/**
 *  设置请求回调,由子类去实现(无进度回调).
 *
 *  @param progressBlock 进度回调
 *  @param successBlock  成功回调
 *  @param messageInfo   信息提示回调
 *  @param failureBlock  失败回调
 */
+ (void)setBlockWithprogress:(ProgressBlock) progressBlock
                successBlock:(ReturnValueBlock) successBlock
                messageBlock:(ReturnValueBlock) messageInfo
                failureBlock:(ReturnValueBlock) failureBlock
{

        baseServer = [[KRBaseServer alloc] init];
        baseServer.progressBlock = progressBlock;
        baseServer.successBlock = successBlock;
        baseServer.messageInfo = messageInfo;
        baseServer.failureBlock = failureBlock;
    
}



/**
 *  设置请求回调,由子类去实现(无进度回调).
 *
 *  @param successBlock 成功回调
 *  @param messageInfo  信息提示回调
 *  @param failureBlock 失败回调
 */
+ (void)setBlockWithSuccessBlock:(ReturnValueBlock) successBlock
                    messageBlock:(ReturnValueBlock) messageInfo
                    failureBlock:(ReturnValueBlock) failureBlock
{
    
    [self setBlockWithprogress:nil successBlock:successBlock messageBlock:messageInfo failureBlock:failureBlock];
}


/**
 字典转模型-->由子类实现.
 
 @param dic 传入的字典.
 
 @return 返回的模型.
 */
+ (id)instanceModelWithDictionary:(NSDictionary *)dic
{
    return nil;
}

- (void)dealloc
{
    _progressBlock = nil;
    _successBlock = nil;
    _messageInfo = nil;
    _failureBlock = nil;
    NSLog(@"KRBaseServer挂了");
}




@end
