//
//  SATVC.h
//  20190421-ScottLoomis-NYCSchools
//
//  Created by Scott Loomis on 4/21/19.
//  Copyright © 2019 Cloud9. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SAT.h"
#import "School.h"
#import <MapKit/MapKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SATVC : UIViewController<MKMapViewDelegate>

@property(strong, nonatomic)SAT * sat;
@property(strong, nonatomic)School * school;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (weak, nonatomic) IBOutlet UILabel *label4;
@property (weak, nonatomic) IBOutlet UILabel *label5;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

NS_ASSUME_NONNULL_END
