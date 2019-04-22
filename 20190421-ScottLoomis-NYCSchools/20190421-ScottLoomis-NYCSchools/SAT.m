//
//  SAT.m
//  20190421-ScottLoomis-NYCSchools
//
//  Created by Scott Loomis on 4/21/19.
//  Copyright © 2019 Cloud9. All rights reserved.
//

#import "SAT.h"

@implementation SAT

+(SAT*)createNewSAT:(NSDictionary*)dict{
    
    
    SAT * newSAT = [[SAT alloc]init];
    
    if ([dict objectForKey:@"dbn"]) {
        newSAT.schoolID = [dict objectForKey:@"dbn"];
    }
    
    if ([dict objectForKey:@"num_of_sat_test_takers"]) {
        newSAT.numberOfTestTakers = [dict objectForKey:@"num_of_sat_test_takers"];
    }
    
    if ([dict objectForKey:@"sat_critical_reading_avg_score"]) {
        newSAT.criticalReadingAvgScore = [dict objectForKey:@"sat_critical_reading_avg_score"];
    }
    
    if ([dict objectForKey:@"sat_math_avg_score"]) {
        newSAT.mathAverageScore = [dict objectForKey:@"sat_math_avg_score"];
    }
    
    if ([dict objectForKey:@"sat_writing_avg_score"]) {
        newSAT.writingAverageScore = [dict objectForKey:@"sat_writing_avg_score"];
    }
    if (newSAT.schoolID == nil) {
        return  nil;
    }
    
    return newSAT;
    
    
}
@end
