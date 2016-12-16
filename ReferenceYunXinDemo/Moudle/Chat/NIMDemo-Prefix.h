//
//  NIMDemo-Prefix.pch
//  NIMDemo
//
//  Created by ght on 15-1-27.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

#ifndef NIMDemo_NIMDemo_Prefix_pch
#define NIMDemo_NIMDemo_Prefix_pch

#ifdef __OBJC__
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "NIMSDK.h"
#import "NIMAVChat.h"
#import "NTESGlobalMacro.h"
#import "NIMKit.h"
#import "FMDB.h"
#import "CocoaLumberjack.h"

#ifdef DEBUG
static DDLogLevel ddLogLevel = DDLogLevelVerbose;
#else
static DDLogLevel ddLogLevel = DDLogLevelInfo;
#endif

#define NTES_USE_CLEAR_BAR - (BOOL)useClearBar{return YES;}

#define NTES_FORBID_INTERACTIVE_POP - (BOOL)forbidInteractivePop{return YES;}


#endif
#endif
