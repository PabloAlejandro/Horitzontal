//
//  ReusableTableViewController.h
//  Horitzontal
//
//  Created by Pablo Alejandro Perez Martinez on 21/08/2016.
//  Copyright © 2016 Pau. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString *const kCellIdentifier;

@interface ReusableTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UITableView * tableView;
@property (nonatomic, copy) NSArray * entries;

@end
