//
//  WebService.m
//  FBTakeHome
//
//  Created by Scott Loomis on 3/9/19.
//  Copyright © 2019 Cloud9. All rights reserved.
//

#import "WebService.h"
#import "School.h"
#import "SAT.h"

@implementation WebService

+(NSArray*)getJSONData:(NSString*)path{
    
    NSString *str = [[NSBundle mainBundle] pathForResource:path ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:str];

    NSError* error;
    NSArray* json = [NSJSONSerialization JSONObjectWithData:data
                                                         options:kNilOptions
                                                           error:&error];
    
    return json;
}

+(void)getSchools:(NSString*)path schoolsArray:(NSMutableArray*)schools{
    
    NSURL* url = [NSURL URLWithString:path];
    
    NSMutableURLRequest * urlReq = [NSMutableURLRequest requestWithURL:url];
    [urlReq setHTTPMethod:@"GET"];
    

    dispatch_semaphore_t sem = dispatch_semaphore_create(0);
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:urlReq completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSError * err = nil;
        
        NSArray * schoolsJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&err];
        
        if (!schoolsJSON) {
            schoolsJSON = [WebService getJSONData:@"mock"];
        }
        
        if (schoolsJSON && schoolsJSON.count > 0) {
            
            //Parse JSON file into data model objects, set into an array
            for(NSDictionary * dict in schoolsJSON){
                
                School * newSchool = [School createNewSchool:dict];
                
                if(newSchool){
                    [schools addObject:newSchool];
                }
                
            }
            
        }
        dispatch_semaphore_signal(sem);
    }] resume];
    
    dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
}

+(void)getSATS:(NSString*)path satsArray:(NSMutableArray*)sats{

    NSURL* url = [NSURL URLWithString:path];
    
    NSMutableURLRequest * urlReq = [NSMutableURLRequest requestWithURL:url];
    [urlReq setHTTPMethod:@"GET"];
    
    dispatch_semaphore_t sem = dispatch_semaphore_create(0);

    [[[NSURLSession sharedSession] dataTaskWithRequest:urlReq completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSError * err = nil;
        
        NSArray * satsJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&err];
        
        if (!satsJSON) {
            satsJSON = [WebService getJSONData:@"mock2"];
        }
        
        if (satsJSON && satsJSON.count > 0) {
            
            //Parse JSON file into data model objects, set into an array
            for(NSDictionary * dict in satsJSON){
                
                SAT * newSAT = [SAT createNewSAT:dict];
                
                if (newSAT) {
                    [sats addObject:newSAT];
                    
                }
                
            }
        }
        dispatch_semaphore_signal(sem);
    }] resume];
    
    dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);

}

@end
