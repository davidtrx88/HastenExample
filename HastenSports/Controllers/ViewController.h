//
//  ViewController.h
//  HastenSports
//
//  Created by David Cruz Toral on 8/4/18.
//  Copyright © 2018 David. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *model;

@end

