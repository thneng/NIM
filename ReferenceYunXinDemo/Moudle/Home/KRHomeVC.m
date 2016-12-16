//
//  KRHomeVC.m
//  云信Test
//
//  Created by kairu on 16/12/1.
//  Copyright © 2016年 凯如科技. All rights reserved.
//

#import "KRHomeVC.h"
//#import "NTESMainTabController.h"
@interface KRHomeVC ()

@end

@implementation KRHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    self.title = @"首页";
    
}


/**
 跳到云信的tabbarVC
 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

//    [[[NIMSDK sharedSDK] loginManager] login:@"kr0520700895" token:@"8531d7cb444e9df659d51bb95cebb43d" completion:^(NSError * _Nullable error) {
//        
//        NTESMainTabController * mainTab = [[NTESMainTabController alloc] initWithNibName:nil bundle:nil];
//        [UIApplication sharedApplication].keyWindow.rootViewController = mainTab;
//    }];
    
}
@end
