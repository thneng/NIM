//
//  KRBaseAFManager.m
//  网络封装Demo
//
//  Created by kairu on 16/8/25.
//  Copyright © 2016年 kairu. All rights reserved.
//

#import "KRAFManager.h"

@implementation KRAFManager

+ (KRAFManager *)shareBaseAFManager
{

    static dispatch_once_t onceToken;
    static KRAFManager *baseAFManager= nil;
    dispatch_once(&onceToken, ^{
        
        /// 设置baseURL
        baseAFManager = [[KRAFManager alloc] initWithBaseURL:[NSURL URLWithString:KR_SERVER]];
        /// 设置请求格式，格式为字典 k-v
        baseAFManager.requestSerializer = [AFHTTPRequestSerializer serializer];
        
        /// 设置返回格式
        baseAFManager.responseSerializer = [AFJSONResponseSerializer serializer];
        /// 设置默认请求时长.
        baseAFManager.requestSerializer.timeoutInterval = 30;
        /// 设置可接受数据类型.
        baseAFManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html", nil];
    });
    
    return baseAFManager;
}

/**
 *  GET方法请求
 *
 *  @param URLString  请求的URL地址
 *  @param parameter  请求的参数
 *  @param progress   进度回调
 *  @param success    成功回调
 *  @param info       信息提示回调
 *  @param failure    失败回调
 */
- (void)GET:(NSString *)URLString
 parameters:(id)parameters
   progress:(void(^)(CGFloat progress)) progress
    success:(returnBlock)success
    message:(returnBlock)info
    failure:(returnBlock)failure
{
    
    [self GET:URLString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        /// 回调上传进度
        if (progress) {
            
            progress((CGFloat)downloadProgress.completedUnitCount/(CGFloat)downloadProgress.totalUnitCount);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
#pragma mark 此处与后台约定返回的jsons数据格式
            if ([responseObject[@"code"] longValue] == 200) {
                /// 返回的code为200
                /// 有data情况.
                if (responseObject[@"data"]) {
                    
                    success(YES,responseObject[@"data"]);
                    
                }
                
            }else {
                
                /// 返回的code不是200
                if (responseObject[@"info"]) {
                    
                    info(NO,[NSString stringWithFormat:@"%@",responseObject[@"info"]]);
                    
                }
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        if (error && failure) {
            failure(NO,error);
        }
    }];
    
}

/**
 *  POST方法请求
 *
 *  @param URLString  请求的URL地址
 *  @param parameter  请求的参数
 *  @param progress   进度回调
 *  @param success    成功回调
 *  @param info       信息提示回调
 *  @param failure    失败回调
 */
- (void)Post:(NSString *)URLString
  parameters:(id)parameters
    progress:(void(^)(CGFloat progress)) progress
     success:(returnBlock)success
     message:(returnBlock)info
     failure:(returnBlock)failure
{
    
    [self POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
        /// 回调上传进度
        if (progress) {
            
            progress((CGFloat)uploadProgress.completedUnitCount/(CGFloat)uploadProgress.totalUnitCount);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success) {
#pragma mark 此处与后台约定返回的jsons数据格式
            if ([responseObject[@"code"] longValue] == 200) {
                /// 返回的code为200
                    /// 有data情况.
                if (responseObject[@"data"]) {
                    
                    success(YES,responseObject[@"data"]);
                    
                }

            }else {
            
                /// 返回的code不是200
                if (responseObject[@"info"]) {
                    
                    info(NO,[NSString stringWithFormat:@"%@",responseObject[@"info"]]);
                    
                }
            }
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (error && failure) {
            failure(NO,error);
        }
        
    }];
    
    
}

/**
 *  上传请求
 *
 *  @param URLString  请求的URL地址
 *  @param parameter  请求的参数
 *  @param progress   上传进度回调
 *  @param success    成功回调
 *  @param info       信息提示回调
 *  @param failure    失败回调
 */
- (void)Upload:(NSString *)URLString
    parameters:(id)parameters
      progress:(void(^)(CGFloat progress)) progress
       success:(returnBlock)success
       message:(returnBlock)info
       failure:(returnBlock)failure
{

    [self POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        if (progress) {
            
            progress((CGFloat)uploadProgress.completedUnitCount/(CGFloat)uploadProgress.totalUnitCount);
        }
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success) {
#pragma mark 此处与后台约定返回的jsons数据格式
            if ([responseObject[@"code"] longValue] == 200) {
                /// 返回的code为200
                /// 有data情况.
                if (responseObject[@"data"]) {
                    
                    success(YES,responseObject[@"data"]);
                    
                }
                
            }else {
                
                /// 返回的code不是200
                if (responseObject[@"info"]) {
                    
                    info(NO,[NSString stringWithFormat:@"%@",responseObject[@"info"]]);
                    
                }
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error && failure) {
            failure(NO,error);
        }
    }];
    
}


- (void)dealloc {
    
    NSLog(@"KRAFManager挂了");
}


@end
