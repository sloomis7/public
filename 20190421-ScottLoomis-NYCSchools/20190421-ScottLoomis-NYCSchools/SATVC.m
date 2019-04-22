//
//  SATVC.m
//  20190421-ScottLoomis-NYCSchools
//
//  Created by Scott Loomis on 4/21/19.
//  Copyright © 2019 Cloud9. All rights reserved.
//

#import "SATVC.h"
#import <CoreLocation/CoreLocation.h>
@interface SATVC (){
    CLLocationCoordinate2D coords;
}
@end

@implementation SATVC

@synthesize nameLabel, label2, school, sat, mapView, label3, label4, label5;

- (void)viewDidLoad {
    [super viewDidLoad];

    nameLabel.text = school.schoolName;
    
    if (sat) {
        label2.text = [NSString stringWithFormat:@"Number of Test Takers: %@", sat.numberOfTestTakers];
        label3.text = [NSString stringWithFormat:@"Critical Reading Average Score: %@", sat.criticalReadingAvgScore];
        label4.text = [NSString stringWithFormat:@"Math Average Score: %@", sat.mathAverageScore];
        label5.text = [NSString stringWithFormat:@"Writing Average Score: %@", sat.writingAverageScore];
    }
    else{
        label2.text = label3.text = label4.text = label5.text = @"";
    }
    
    coords.latitude = [school.lat doubleValue];
    coords.longitude = [school.lng doubleValue];
    
    CLLocationDistance distance = 1000;
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coords, distance, distance);

    [mapView setRegion:region];
}


-(void)mapViewDidFinishLoadingMap:(MKMapView *)mapView{
    
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = coords;
    [mapView addAnnotation:point];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
