//
//  UITableView+HeaderView.m
//  TableViewHeaderTest
//
//  Created by Jordon on 16/2/28.
//  Copyright (c) 2016年 Jordon. All rights reserved.
//

#import "UITableView+HeaderView.h"
#import <objc/runtime.h>

@implementation UITableView (HeaderView)

- (void)headerView:(UIView *)headerView forSeciton:(NSInteger)section {
    
    //add tapGesture to the headerView so it can be selected.
    [headerView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHeaderView:)]];
    
    //save the headerView to headerViews property.
    [self.headerViews replaceObjectAtIndex:section withObject:headerView];
}

- (void)tapHeaderView:(UITapGestureRecognizer *)sender {
    
    UIView *headerView = sender.view;
    
    NSInteger section = [self.headerViews indexOfObject:headerView];
    
    //callback method depends on the headerView's selection.
    if ([self.selections[section] boolValue]) {
        [self.selections replaceObjectAtIndex:section withObject:@(NO)];
        [(id <UITableViewDelegate_HeaderViewSelection>)self.delegate tableView:self didDeselectHeaderView:headerView inSection:section];
    }else {
        [self.selections replaceObjectAtIndex:section withObject:@(YES)];
        [(id <UITableViewDelegate_HeaderViewSelection>)self.delegate tableView:self didSelectHeaderView:headerView inSection:section];
    }
}

- (BOOL)headerViewSelectedInSection:(NSInteger)section {
    return [self.selections[section] boolValue];
}

// category property to save the headerViews and selections

- (NSMutableArray *)headerViews {
    
    NSMutableArray *headerViews = objc_getAssociatedObject(self, "HeaderViews");
    
    if (!headerViews) {
        headerViews = [NSMutableArray array];
        for (int i = 0; i < [self numberOfSections]; i++) {
            [headerViews addObject:[UIView new]];
        }
        
        objc_setAssociatedObject(self, "HeaderViews", headerViews, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return headerViews;
}

- (NSMutableArray *)selections {
    
    NSMutableArray *selections = objc_getAssociatedObject(self, "Selections");
    
    if (!selections) {
        selections = [NSMutableArray array];
        for (int i = 0; i < [self numberOfSections]; i++) {
            [selections addObject:@(NO)];
        }
        
        objc_setAssociatedObject(self, "Selections", selections, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return selections;
}
@end
