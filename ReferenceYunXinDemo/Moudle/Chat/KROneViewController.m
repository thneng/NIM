//
//  KROneViewController.m
//  ReferenceYunXinDemo
//
//  Created by kairu on 16/12/14.
//  Copyright © 2016年 凯如科技. All rights reserved.
//

#import "KROneViewController.h"
#import "NIMSessionListCell.h"
#import "NTESUserUtil.h"

@interface KROneViewController ()

@property (nonatomic, copy) NSMutableArray *TeamSessions;

@property (nonatomic, copy) NSMutableArray *p2pSessions;

@end

@implementation KROneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    for (NIMRecentSession *session in self.recentSessions) {
        if (session.session.sessionType == 0) { // p2p
            [self.p2pSessions addObject:session];
        }else {
        
            [self.TeamSessions addObject:session];
        }
    }
}


# pragma override
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section == 0) {
        return self.p2pSessions.count;
    }else {
    
        return self.TeamSessions.count;
    }
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {

    if (section == 0) {
        return @"最近联系人";
    }else {
    
        return @"推荐群组";
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPat
{
    

    if (indexPat.section == 0) { // 最近联系人.
        self.recentSessions = self.p2pSessions;
    }else {
    
        self.recentSessions = self.TeamSessions;
    }
    
    return [super tableView:tableView cellForRowAtIndexPath:indexPat];;
}

#pragma mark - 懒加载
- (NSMutableArray *)p2pSessions {

    if (!_p2pSessions) {
        _p2pSessions = [[NSMutableArray alloc] init];
    }
    return _p2pSessions;
}

-(NSMutableArray *)TeamSessions {

    if (!_TeamSessions) {
        _TeamSessions = [[NSMutableArray alloc] init];
    }
    return _TeamSessions;
}

@end
