//
//  ViewController.h
//  Test
//
//  Created by Scott Loomis on 2/2/19.
//  Copyright © 2019 Cloud9. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;



@end

