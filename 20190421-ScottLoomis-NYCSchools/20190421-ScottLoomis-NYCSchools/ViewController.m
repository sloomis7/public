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


@interface ViewController (){
    
    NSMutableArray * sats;
    NSMutableArray * schools;
    NSMutableDictionary * satsDict;

    ItemCell * itemLayoutCell;
    
    AppDelegate * appDelegate;
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
    
    NSArray * schoolsJSON = [WebService getJSONData:@"mock"];
    NSArray * satsJSON = [WebService getJSONData:@"mock2"];

    
    if (schoolsJSON && schoolsJSON.count > 0) {
        
        //Parse JSON file into data model objects, set into an array
        for(NSDictionary * dict in schoolsJSON){
            
            School * newSchool = [School createNewSchool:dict];
            
            if(newSchool){
                [schools addObject:newSchool];
            }
            
        }
        
    }
    
    if (satsJSON && satsJSON.count > 0) {
        
        //Parse JSON file into data model objects, set into an array
        for(NSDictionary * dict in satsJSON){
            
            SAT * newSAT = [SAT createNewSAT:dict];
            
            if (newSAT) {
                [sats addObject:newSAT];

            }
            
        }
        
        for (SAT * sat in sats){
            
            [satsDict setObject:sat forKey:sat.schoolID];
            
        }
    }
    
    [tableView reloadData];

    
   
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


@end
