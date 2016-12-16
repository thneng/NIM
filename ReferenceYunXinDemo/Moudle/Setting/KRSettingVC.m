//
//  KRSettingVC.m
//  云信Test
//
//  Created by kairu on 16/12/1.
//  Copyright © 2016年 凯如科技. All rights reserved.
//

#import "KRSettingVC.h"
#import "UIAlertView+NTESBlock.h"
@interface KRSettingVC ()

@end

@implementation KRSettingVC


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    self.title = @"我的";
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    // 注销账号.
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"退出当前帐号？" message:nil delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert showAlertWithCompletionHandler:^(NSInteger alertIndex) {
        switch (alertIndex) {
            case 1:
                
                [[NSNotificationCenter defaultCenter] postNotificationName:@"NTESNotificationLogout" object:nil];
                
                [[[NIMSDK sharedSDK] loginManager] logout:^(NSError *error)
                 {
                     extern NSString *NTESNotificationLogout;
                     [[NSNotificationCenter defaultCenter] postNotificationName:NTESNotificationLogout object:nil];
                 }];
                break;
            default:
                break;
        }
    }];
}

@end
