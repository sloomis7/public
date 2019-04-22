//
//  School.h
//  20190421-ScottLoomis-NYCSchools
//
//  Created by Scott Loomis on 4/21/19.
//  Copyright © 2019 Cloud9. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface School : NSObject

+(School*)createNewSchool:(NSDictionary*)dict;

@property(nonatomic, strong)NSString* schoolName;
@property(nonatomic, strong)NSString* city;
@property(nonatomic, strong)NSString* address;

@property(nonatomic, strong)NSString* schoolID;

@property(nonatomic, strong)NSString* lat;
@property(nonatomic, strong)NSString* lng;

@end

NS_ASSUME_NONNULL_END
