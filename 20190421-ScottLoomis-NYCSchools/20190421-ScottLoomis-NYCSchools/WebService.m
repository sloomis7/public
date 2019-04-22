//
//  WebService.m
//  FBTakeHome
//
//  Created by Scott Loomis on 3/9/19.
//  Copyright © 2019 Cloud9. All rights reserved.
//

#import "WebService.h"

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

@end
