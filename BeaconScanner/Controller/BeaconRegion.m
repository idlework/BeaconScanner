//
//  BeaconRegion.m
//  BeaconScanner
//
//  Created by Johan Haneveld on 2/26/14.
//  Copyright (c) 2014 Idlework. All rights reserved.
//

#import "BeaconRegion.h"

// https://github.com/nst/iOS-Runtime-Headers/blob/master/Frameworks/CoreLocation.framework/CLRegion.h
struct ClientRegion {
    BOOL identifier[512];
    int type;
    bool notifyOnEntry;
    bool notifyOnExit;
    union {
        struct {
            BOOL proximityUUID[512];
            unsigned short major;
            unsigned short minor;
            int definitionMask;
            bool notifyEntryStateOnDisplay;
        } beaconAttributes;
        struct {
            struct {
                double latitude;
                double longitude;
            } center;
            double radius;
            double desiredAccuracy;
        } circularAttributes;
    };
};

@interface CLBeaconRegion (Hidden)

- (id)initWithIdentifier:(NSString *)identifier;
- (struct ClientRegion)clientRegion;

@end

@implementation BeaconRegion

- (id)initWithIdentifier:(NSString *)identifier;
{
    return (self = [super initWithIdentifier:identifier]);
}

- (struct ClientRegion)clientRegion
{
    struct ClientRegion clientRegion = [super clientRegion];
    
    // definitionMask:
    //                  1 => uuid
    //                  3 => uuid + major
    //                  7 => uuid + major + minor
    
    clientRegion.beaconAttributes.definitionMask = ~0x07;
    
    return clientRegion;
}

@end
