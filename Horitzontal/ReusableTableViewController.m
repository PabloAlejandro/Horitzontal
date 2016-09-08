//
//  ReusableTableViewController.m
//  Horitzontal
//
//  Created by Pablo Alejandro Perez Martinez on 21/08/2016.
//  Copyright © 2016 Pau. All rights reserved.
//

#import "ReusableTableViewController.h"

NSString *const kCellIdentifier = @"cellID";
NSString *const kTableCellNibName = @"TableCell";

@implementation ReusableTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // we use a nib which contains the cell's view and this class as the files owner
//    [self.tableView registerNib:[UINib nibWithNibName:kTableCellNibName bundle:nil] forCellReuseIdentifier:kCellIdentifier];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellIdentifier];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.entries.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.entries.count ? 1 : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Override this method
    assert(0);
    return nil;
}

@end
