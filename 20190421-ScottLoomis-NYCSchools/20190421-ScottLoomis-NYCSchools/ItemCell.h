//
//  ItemCell.h
//  Test
//
//  Created by Scott Loomis on 2/3/19.
//  Copyright © 2019 Cloud9. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kItemCell @"itemCell"

@interface ItemCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *mainLabel;
@property (weak, nonatomic) IBOutlet UILabel *subLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondLabel;

@end
