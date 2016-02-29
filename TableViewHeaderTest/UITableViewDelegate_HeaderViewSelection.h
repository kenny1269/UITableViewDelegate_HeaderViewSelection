//
//  UITableViewDelegate_HeaderViewSelection.h
//  TableViewHeaderTest
//
//  Created by Jordon on 16/2/28.
//  Copyright (c) 2016年 Jordon. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UITableViewDelegate_HeaderViewSelection <UITableViewDelegate>
@required

- (void)tableView:(UITableView *)tableView didSelectHeaderView:(UIView *)headerView inSection:(NSInteger)section;

- (void)tableView:(UITableView *)tableView didDeselectHeaderView:(UIView *)headerView inSection:(NSInteger)section;

//- (void)tableView:(UITableView *)tableView didTapHeaderView:(UIView *)headerView inSection:(NSInteger)section;

@end
