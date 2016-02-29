//
//  TableViewController.m
//  TableViewHeaderTest
//
//  Created by Jordon on 16/2/27.
//  Copyright (c) 2016年 Jordon. All rights reserved.
//

#import "TableViewController.h"

#import "UITableView+HeaderView.h"

@interface TableViewController () 

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableFooterView = [UIView new];
}

#pragma mark - UITableViewDelegate_Header

- (void)tableView:(UITableView *)tableView didSelectHeaderView:(UIView *)headerView inSection:(NSInteger)section {
    NSMutableIndexSet *set = [[NSMutableIndexSet alloc] initWithIndex:section];
    
    [self.tableView reloadSections:set withRowAnimation:(UITableViewRowAnimationFade)];
}

- (void)tableView:(UITableView *)tableView didDeselectHeaderView:(UIView *)headerView inSection:(NSInteger)section {
    NSMutableIndexSet *set = [[NSMutableIndexSet alloc] initWithIndex:section];
    
    [self.tableView reloadSections:set withRowAnimation:(UITableViewRowAnimationFade)];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UITableViewHeaderFooterView *headerView = [[UITableViewHeaderFooterView alloc] init];
    
    headerView.textLabel.text = [NSString stringWithFormat:@"section %ld",section];
    
    headerView.contentView.backgroundColor = [UIColor cyanColor];
    
    [tableView headerView:headerView forSeciton:section];
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    BOOL selected = [tableView headerViewSelectedInSection:section];
    
    return selected ? 4 : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"row %ld",indexPath.row];
    
    // Configure the cell...
    
    return cell;
}

@end
