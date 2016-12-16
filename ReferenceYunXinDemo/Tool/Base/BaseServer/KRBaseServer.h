//
//  KRBaseModel.h
//  网络封装Demo
//
//  Created by kairu on 16/8/25.
//  Copyright © 2016年 kairu. All rights reserved.
//
#import <UIKit/UIKit.h>

typedef void(^ReturnValueBlock)(id returnValue);
typedef void(^ProgressBlock)(CGFloat progress);
@interface KRBaseServer : NSObject

/// 进度值的回调.
+ (ProgressBlock)progressBlock;
/// 数据成功返回回调
+ (ReturnValueBlock)successBlock;
/// 失败返回回调
+ (ReturnValueBlock)messageInfo;
/// 提示语回调
+ (ReturnValueBlock)failureBlock;

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
                failureBlock:(ReturnValueBlock) failureBlock;

/**
 *  设置请求回调,由子类去实现(无进度回调).
 *
 *  @param successBlock 成功回调
 *  @param messageInfo  信息提示回调
 *  @param failureBlock 失败回调
 */
+ (void)setBlockWithSuccessBlock:(ReturnValueBlock) successBlock
                    messageBlock:(ReturnValueBlock) messageInfo
                    failureBlock:(ReturnValueBlock) failureBlock;


/**
 字典转模型.

 @param dic 传入的字典.

 @return 返回的模型.
 */
+ (id)instanceModelWithDictionary:(NSDictionary *)dic;

@end
