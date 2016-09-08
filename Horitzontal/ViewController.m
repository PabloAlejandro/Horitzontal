//
//  ViewController.m
//  Horitzontal
//
//  Created by Pablo Alejandro Perez Martinez on 21/08/2016.
//  Copyright © 2016 Pau. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.entries = @[@"entry 1", @"entry 2", @"entry 3", @"entry 4", @"entry 5"];
    self.tableView.transform = CGAffineTransformMakeRotation(-M_PI_2);
    self.tableView.pagingEnabled = YES;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.tableView.frame = CGRectMake(0, 22, CGRectGetHeight(self.tableView.frame), CGRectGetWidth(self.tableView.frame));
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Override this method
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = self.entries[indexPath.row];
    cell.textLabel.backgroundColor = [UIColor redColor];
    cell.transform = CGAffineTransformMakeRotation(M_PI_2);
    cell.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:1 - 0.2 * indexPath.row];
    
//    cell.frame = CGRectMake(CGRectGetWidth(tableView.frame), 100, CGRectGetHeight(cell.frame), CGRectGetWidth(cell.frame));
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CGRectGetHeight(tableView.bounds);
}

@end
