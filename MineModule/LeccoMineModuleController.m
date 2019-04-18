//
//  LeccoMineModuleController.m
//  MineModuleDemo
//
//  Created by yixin on 2019/1/2.
//  Copyright © 2019 lecco. All rights reserved.
//

#import "LeccoMineModuleController.h"
#import <Masonry/Masonry.h>
#import "LeccoMineModuleCell.h"
#import "LeccoMineModuleTableHeaderView.h"

@interface LeccoMineModuleController ()<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) LeccoMineModuleTableHeaderView *headerView;
@end

@implementation LeccoMineModuleController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"MineModuleBundle.bundle/LeccoMineModuleCell" bundle:nil] forCellReuseIdentifier:@"LeccoMineModuleCellYXIdentifier"];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.equalTo(self.view).offset(0);
    }];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 3;
    }
    
    if (section == 1) {
        return 2;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LeccoMineModuleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LeccoMineModuleCellYXIdentifier" forIndexPath:indexPath];
    return cell;
}

- (LeccoMineModuleTableHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[[NSBundle mainBundle] loadNibNamed:@"MineModuleBundle.bundle/LeccoMineModuleTableHeaderView" owner:nil options:nil] firstObject];
    }
    return _headerView;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    }
    return _tableView;
}

@end
