//
//  ViewController.m
//  Test
//
//  Created by Scott Loomis on 2/2/19.
//  Copyright © 2019 Cloud9. All rights reserved.
//

#import "ViewController.h"
#import "ItemCell.h"

#import "School.h"
#import "SAT.h"
#import "WebService.h"
#import "AppDelegate.h"
#import "SATVC.h"

#define kSchoolsURL @"https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
#define kSATSURL @"https://data.cityofnewyork.us/resource/f9bf-2cp4.json"


@interface ViewController (){
    
    NSMutableArray * sats;
    NSMutableArray * schools;
    NSMutableDictionary * satsDict;

    ItemCell * itemLayoutCell;
    
    AppDelegate * appDelegate;
    
    NSOperationQueue * operationQueue;
    BOOL WSLoaded;
}

@end

@implementation ViewController


@synthesize tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"Schools";
    
    appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    schools = [[NSMutableArray alloc]init];
    sats = [[NSMutableArray alloc]init];
    satsDict = [[NSMutableDictionary alloc]init];
    
    operationQueue = [[NSOperationQueue alloc]init];
    
    [operationQueue addObserver:self forKeyPath:@"operations" options:0 context:nil];
    
    [operationQueue addOperationWithBlock:^{
        [WebService getSchools:kSchoolsURL schoolsArray:schools];
        
    }];
    
    [operationQueue addOperationWithBlock:^{
        [WebService getSATS:kSATSURL satsArray:sats];
    }];
    

    
    
    

    
   
}


#pragma mark - TableView Delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return schools.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    UITableViewCell * cell;
    
    
    ItemCell * itemCell = [tableView dequeueReusableCellWithIdentifier:kItemCell];
    
    
    
    if (!itemCell) {
        itemCell = [[ItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kItemCell];
    }
    
    
    [self configureHeightForItemCell:itemCell indexPath:indexPath];

    
    
    cell = itemCell;
    

    
    return cell;
}

-(void)configureHeightForItemCell:(ItemCell*)itemCell indexPath:(NSIndexPath*)indexPath{
    
    School * school = [schools objectAtIndex:indexPath.row];
    
    itemCell.mainLabel.text = school.schoolName;
    
    
    itemCell.secondLabel.text = school.city;
    itemCell.subLabel.text = school.address;
    
    itemCell.mainLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - itemCell.secondLabel.intrinsicContentSize.width - 8 - 8 - 8;
    
    itemCell.secondLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - itemCell.mainLabel.intrinsicContentSize.width - 8 - 8 - 8;
    
}

- (CGFloat)calculateHeightForConfiguredCell:(UITableViewCell *)aSizingCell {
    
    [aSizingCell setNeedsLayout];
    [aSizingCell layoutIfNeeded];
    
    CGSize size = [aSizingCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size.height;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    SATVC * satVC = [[SATVC alloc]initWithNibName:@"SATVC" bundle:nil];
    
    School * school = [schools objectAtIndex:indexPath.row];

    satVC.sat = [satsDict objectForKey:school.schoolID];
    satVC.school = school;
    
    [self.navigationController pushViewController:satVC animated:YES];
     
    
    
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (!itemLayoutCell) {
        itemLayoutCell = [[ItemCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kItemCell];
    }
    
    [self configureHeightForItemCell:itemLayoutCell indexPath:indexPath];
    
    return  [self calculateHeightForConfiguredCell:itemLayoutCell];
}

#pragma mark

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    
    if ([object isKindOfClass:[NSOperationQueue class]]) {
        
        NSOperationQueue * opQueue = (NSOperationQueue*)object;
        if (opQueue.operations.count == 0 && !WSLoaded) {
            
            for (SAT * sat in sats){
                
                [satsDict setObject:sat forKey:sat.schoolID];
                
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [tableView reloadData];
            });
            WSLoaded = YES;
        }
    }
    
}

@end
