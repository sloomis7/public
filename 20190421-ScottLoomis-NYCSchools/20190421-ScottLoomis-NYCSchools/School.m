//
//  School.m
//  20190421-ScottLoomis-NYCSchools
//
//  Created by Scott Loomis on 4/21/19.
//  Copyright © 2019 Cloud9. All rights reserved.
//

#import "School.h"

@implementation School

+(School*)createNewSchool:(NSDictionary*)dict{
    
    School * newSchool = [[School alloc]init];
    
    if ([dict objectForKey:@"school_name"]) {
        newSchool.schoolName = [dict objectForKey:@"school_name"];
    }
    
    if ([dict objectForKey:@"city"]) {
        newSchool.city = [dict objectForKey:@"city"];
    }
    
    if ([dict objectForKey:@"primary_address_line_1"]) {
        newSchool.address = [dict objectForKey:@"primary_address_line_1"];
    }
    
    if ([dict objectForKey:@"dbn"]) {
        newSchool.schoolID = [dict objectForKey:@"dbn"];
    }
    
    if ([dict objectForKey:@"latitude"]) {
        newSchool.lat = [dict objectForKey:@"latitude"];
    }
    
    if ([dict objectForKey:@"longitude"]) {
        newSchool.lng = [dict objectForKey:@"longitude"];
    }

    
    if (newSchool.schoolID == nil) {
        return nil;
    }
    return newSchool;

}


@end
