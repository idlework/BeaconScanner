//
//  BeaconLocationManager.h
//  BeaconScanner
//
//  Created by Johan Haneveld on 2/26/14.
//  Copyright (c) 2014 Idlework. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

#import "BeaconLocationManagerDelegate.h"
#import "BeaconRegion.h"

@protocol BeaconLocationManagerDelegate;

@interface BeaconLocationManager : NSObject <CLLocationManagerDelegate>

@property (weak, nonatomic) id<BeaconLocationManagerDelegate> delegate;

@property (strong, nonatomic) NSArray *beacons;
@property (strong, nonatomic) NSMutableDictionary *beaconsReference;
@property (strong, nonatomic) CLLocationManager *locationManager;

@end
