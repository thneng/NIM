//
//  KRTwoViewController.m
//  ReferenceYunXinDemo
//
//  Created by kairu on 16/12/14.
//  Copyright © 2016年 凯如科技. All rights reserved.
//

#import "KRTwoViewController.h"

@interface KRTwoViewController ()

@end

@implementation KRTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"secondController";
    label.font = [UIFont systemFontOfSize:17];
    label.frame = CGRectMake(100, 100, 200, 100);
    [self.view addSubview:label];
}


@end
