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
    [_beaconsReference removeAllObjects];
    
    NSArray *unknownBeacons = [beacons filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"proximity = %d", CLProximityUnknown]];
    
    if([unknownBeacons count])
    {
        [_beaconsReference setObject:unknownBeacons forKey:[NSNumber numberWithInt:CLProximityUnknown]];
    }
    
    NSArray *immediateBeacons = [beacons filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"proximity = %d", CLProximityImmediate]];
    
    if([immediateBeacons count])
    {
        [_beaconsReference setObject:immediateBeacons forKey:[NSNumber numberWithInt:CLProximityImmediate]];
    }
    
    NSArray *nearBeacons = [beacons filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"proximity = %d", CLProximityNear]];
    
    if([nearBeacons count])
    {
        [_beaconsReference setObject:nearBeacons forKey:[NSNumber numberWithInt:CLProximityNear]];
    }
    
    NSArray *farBeacons = [beacons filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"proximity = %d", CLProximityFar]];
    
    if([farBeacons count])
    {
        [_beaconsReference setObject:farBeacons forKey:[NSNumber numberWithInt:CLProximityFar]];
    }
    
    [self.delegate beaconCollectionUpdated:_beaconsReference];
}

- (void)locationManager:(CLLocationManager *)manager rangingBeaconsDidFailForRegion:(CLBeaconRegion *)region withError:(NSError *)error
{
    NSLog(@"rangingBeaconsDidFail: %@ withError:%@", region, error);
}

@end
