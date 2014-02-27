//
//  BeaconLocationManager.m
//  BeaconScanner
//
//  Created by Johan Haneveld on 2/26/14.
//  Copyright (c) 2014 Idlework. All rights reserved.
//

#import "BeaconLocationManager.h"

@implementation BeaconLocationManager

@synthesize beacons = _beacons;
@synthesize locationManager = _locationManager;
@synthesize beaconsReference = _beaconsReference;

- (id)init
{
    self = [super init];
    
    if (self)
    {
        _beaconsReference = [[NSMutableDictionary alloc] init];
        
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
        
        BeaconRegion *region = [[BeaconRegion alloc] initWithIdentifier:@"Any"];
        [_locationManager startRangingBeaconsInRegion:region];
    }
    
    return self;
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    NSLog(@"didChangeAuthorizationStatus: %d", status);
}

- (void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region
{
    CLBeacon *beacon;
    NSString *key;
    bool updated;
    
    for (NSUInteger i = 0; i < beacons.count; i++)
    {
        beacon = beacons[i];
        key = [beacon.major stringValue];
        
        if (![_beaconsReference objectForKey:key])
        {
            [_beaconsReference setObject:beacon forKey:key];
            
            updated = YES;
        }
    }
    
    if (updated)
    {
        [self.delegate beaconCollectionUpdated:_beaconsReference.allValues];
    }
}

- (void)locationManager:(CLLocationManager *)manager rangingBeaconsDidFailForRegion:(CLBeaconRegion *)region withError:(NSError *)error
{
    NSLog(@"rangingBeaconsDidFail: %@ withError:%@", region, error);
}

@end
