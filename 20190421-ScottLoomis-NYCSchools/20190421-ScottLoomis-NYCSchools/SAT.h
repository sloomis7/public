//
//  SAT.h
//  20190421-ScottLoomis-NYCSchools
//
//  Created by Scott Loomis on 4/21/19.
//  Copyright © 2019 Cloud9. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SAT : NSObject
+(SAT*)createNewSAT:(NSDictionary*)dict;

@property(strong, nonatomic)NSString* schoolID;
@property(strong, nonatomic)NSString* numberOfTestTakers;
@property(strong, nonatomic)NSString* criticalReadingAvgScore;
@property(strong, nonatomic)NSString* mathAverageScore;
@property(strong, nonatomic)NSString* writingAverageScore;

@end

NS_ASSUME_NONNULL_END
