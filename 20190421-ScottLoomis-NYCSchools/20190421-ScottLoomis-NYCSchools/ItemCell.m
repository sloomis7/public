//
//  ItemCell.m
//  Test
//
//  Created by Scott Loomis on 2/3/19.
//  Copyright © 2019 Cloud9. All rights reserved.
//

#import "ItemCell.h"

@implementation ItemCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSArray * nibArray = [[NSBundle mainBundle] loadNibNamed:@"ItemCell" owner:self options:nil];
        
        
        self = [nibArray objectAtIndex:0];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
    }
    return self;
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
