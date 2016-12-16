//
//  KRConfigure.m
//  SunshineHealthy
//
//  Created by jiwuwang on 16/3/5.
//  Copyright © 2016年 深圳市凯如科技有限公司. All rights reserved.
//

#import "KRConfigure.h"


#define DWIDTH  375             //设计时使用宽度
#define DHEIGHT 667             //设计时使用高度

static KRConfigure *_shareConfigure = nil;

@implementation KRConfigure

+ (KRConfigure *)shareConfigure {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _shareConfigure = [[self alloc] init];
        
        
    });
    
    return _shareConfigure;
}

- (instancetype)init {
    self =  [super init];
    if (self) {
        
        self.fontSize = [UIFont systemFontSize];
        self.width = 375.f;
        self.height = 667.f;

    }
    
    return self;
}

- (CGFloat)scale_width
{
    CGFloat width = DWIDTH;
    
    if (IS_IPHONE_4_OR_LESS) {
        width = 320;
    }else if (IS_IPHONE_5){
        width = 320;
    }else if (IS_IPHONE_6){
        width = 375;
    }else if (IS_IPHONE_6P){
        width = 414;
    }else if (IS_IPAD)
    {
        width = 768;
    }
    
    CGFloat scale = width / DWIDTH;
    
    return scale;
    
}

- (CGFloat)scale_height {
    CGFloat height = DHEIGHT;
    if (IS_IPHONE_4_OR_LESS) {
        height = 480;
    }else if (IS_IPHONE_5){
        height = 568;
    }else if (IS_IPHONE_6){
        height = 667;
    }else if (IS_IPHONE_6P){
        height = 736;
    }else if (IS_IPAD)
    {
        height = 1024;
    }
    
    CGFloat scale = height / DHEIGHT;
    
    return scale;
}

- (CGFloat)scale {
    
    return self.scale_width < self.scale_height ? self.scale_width : self.scale_height;
    
}

//字体大小适配
- (CGFloat)fitWithFontSize:(CGFloat )size
{
    
    if (!size) {
        return self.fontSize * self.scale;
    }
    
    if (IS_IPAD) {
        
        return size * 1.25;
        
    }else if (IS_IPHONE_4_OR_LESS)
    {
        return size;
    }
    
    return size * self.scale;
}
//高度适配
- (CGFloat)fitWithHeight:(CGFloat )height
{
    
    if (!height) {
        return self.height * self.scale_height;
    }
    
    return height * self.scale_height;
}
//宽度适配
- (CGFloat)fitWithWidth:(CGFloat )width
{
    
    if (!width) {
        return self.width * self.scale_width;
    }
    
    return width * self.scale_width;
}

- (CGFloat)fitScale:(CGFloat)a
{
    return self.scale * a;
}

@end
