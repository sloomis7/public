//
//  WebService.h
//  FBTakeHome
//
//  Created by Scott Loomis on 3/9/19.
//  Copyright © 2019 Cloud9. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebService : NSObject

+(NSArray*)getJSONData:(NSString*)path;

@end
