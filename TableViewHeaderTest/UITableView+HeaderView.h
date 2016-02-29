//
//  UITableView+HeaderView.h
//  TableViewHeaderTest
//
//  Created by Jordon on 16/2/28.
//  Copyright (c) 2016年 Jordon. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UITableViewDelegate_HeaderViewSelection.h"

@interface UITableView (HeaderView)

- (void)headerView:(UIView *)headerView forSeciton:(NSInteger)section;

- (BOOL)headerViewSelectedInSection:(NSInteger)section;

@end
