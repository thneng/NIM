//
//  KRCharViewController.m
//  YunxinDemo
//
//  Created by kairu on 16/12/2.
//  Copyright © 2016年 凯如科技. All rights reserved.
//

#import "KRCharViewController.h"
#import "KROneViewController.h"
#import "KRTwoViewController.h"

#define navigationHeight 64
#define mainVcWidth [UIScreen mainScreen].bounds.size.width
#define mainVcHeight [UIScreen mainScreen].bounds.size.height

@interface KRCharViewController ()

@property (nonatomic,strong)   KROneViewController *fristVc;

@property (nonatomic,strong) KRTwoViewController *secondVc;

@property (nonatomic,strong) UIViewController * currentVC;

@end

@implementation KRCharViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.titleView = [self setupSegment];
    
    self.fristVc = [[KROneViewController alloc] init];
    self.fristVc.view.frame = CGRectMake(0, 0, mainVcWidth, mainVcHeight);
    [self addChildViewController:_fristVc];
    
    self.secondVc = [[KRTwoViewController alloc] init];
    self.secondVc.view.frame = CGRectMake(0, 0, mainVcWidth, mainVcHeight);
    [self addChildViewController:_secondVc];
    
    //设置默认控制器为fristVc
    self.currentVC = self.fristVc;
    [self.view addSubview:self.fristVc.view];
}

/**
 *  初始化segmentControl
 */
- (UISegmentedControl *)setupSegment{
    NSArray *items = @[@"1", @"2"];
    UISegmentedControl *sgc = [[UISegmentedControl alloc] initWithItems:items];
    //默认选中的位置
    sgc.selectedSegmentIndex = 0;
    //设置segment的文字
    [sgc setTitle:@"纸条" forSegmentAtIndex:0];
    [sgc setTitle:@"话题" forSegmentAtIndex:1];
    //监听点击
    [sgc addTarget:self action:@selector(segmentChange:) forControlEvents:UIControlEventValueChanged];
    return sgc;
}


//监听segmentControl点击事件：
- (void)segmentChange:(UISegmentedControl *)sgc{
    //NSLog(@"%ld", sgc.selectedSegmentIndex);
    switch (sgc.selectedSegmentIndex) {
        case 0:
            [self replaceFromOldViewController:self.secondVc toNewViewController:self.fristVc];
            break;
        case 1:
            [self replaceFromOldViewController:self.fristVc toNewViewController:self.secondVc];
            break;
        default:
            break;
    }
}




/**
 *  实现控制器的切换
 *
 *  @param oldVc 当前控制器
 *  @param newVc 要切换到的控制器
 */
- (void)replaceFromOldViewController:(UIViewController *)oldVc toNewViewController:(UIViewController *)newVc{
    /**
     *  transitionFromViewController:toViewController:duration:options:animations:completion:
     *  fromViewController    当前显示在父视图控制器中的子视图控制器
     *  toViewController        将要显示的姿势图控制器
     *  duration                动画时间(这个属性,old friend 了 O(∩_∩)O)
     *  options              动画效果(渐变,从下往上等等,具体查看API)UIViewAnimationOptionTransitionCrossDissolve
     *  animations            转换过程中得动画
     *  completion            转换完成
     */
    [self addChildViewController:newVc];
    [self transitionFromViewController:oldVc toViewController:newVc duration:0.1 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished) {
        if (finished) {
            [newVc didMoveToParentViewController:self];
            [oldVc willMoveToParentViewController:nil];
            [oldVc removeFromParentViewController];
            self.currentVC = newVc;
        }else{
            self.currentVC = oldVc;
        }
    }];
}
@end
