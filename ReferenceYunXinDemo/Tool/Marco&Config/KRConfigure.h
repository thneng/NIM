//
//  KRConfigure.h
//  SunshineHealthy
//
//  Created by jiwuwang on 16/3/5.
//  Copyright © 2016年 深圳市凯如科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define WIDTH_SCALE 375.0/320.0

#define ipad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

/*
 
 常用颜色rgb值
 
 */
// 颜色(RGB)
#define RGBCOLOR(r, g, b)       [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r, g, b, a)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

#define KRRandomColor RGBCOLOR(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

///navgationBar颜色
#define kNavgationBarColor  RGBCOLOR(255,255,255)
///navgationBar title 颜色
#define kNavgationTitleColor    RGBCOLOR(76,76,76)

///navgationBar bar 颜色
#define kNavgationTintColor    RGBCOLOR(113,113,113)

///Tabbar颜色
#define kTabBarColor        RGBCOLOR(255,255,255)
///选中tabbaritem 颜色
#define kTabBarTextColor    RGBCOLOR(95,100,110)
///未选中tabbarItem 颜色
#define kNTabbarTextColor   RGBCOLOR(95,100,110)
///tableview背景底颜色
#define kBackGroundColor    RGBCOLOR(238, 238, 238)
///搜索背景底颜色
#define kSearchBackGroundColor    RGBCOLOR(237,237,237)

/// 引索颜色
#define kSectionIndexColor      RGBCOLOR(189, 8, 28)

/// 自定义分割线颜色
#define kSepartorColor          RGBCOLOR(225, 225, 225);

/// 蓝颜色
#define kBlueColor          RGBCOLOR(34,163,255)

/// grary76
#define kGrary76            RGBCOLOR(76,76,76)

/// 灰色字
#define kTextGrayColor      RGBCOLOR(153,153,153)

/// placeolder color
#define kPlaceolderColor    RGBCOLOR(199, 199, 205)

/// 黑色字
#define kTextBlackColor     RGBCOLOR(5,27,40)

//侧栏颜色
#define kLeftBgColor        RGBCOLOR(71, 79, 86)

@interface KRConfigure : NSObject

//适配UI
@property (nonatomic, assign) CGFloat fontSize;     //字体大小
@property (nonatomic, assign) CGFloat height;       //高度
@property (nonatomic, assign) CGFloat width;        //宽

@property (nonatomic, assign) CGFloat scale_width;   //宽度缩放
@property (nonatomic, assign) CGFloat scale_height; //高度缩放

@property (nonatomic, assign) CGFloat scale;        //缩放

+ (KRConfigure *)shareConfigure;

//字体大小适配
- (CGFloat)fitWithFontSize:(CGFloat )size;
//高度适配
- (CGFloat)fitWithHeight:(CGFloat )height;
//宽度适配
- (CGFloat)fitWithWidth:(CGFloat )width;

- (CGFloat)fitScale:(CGFloat)a;

@end
