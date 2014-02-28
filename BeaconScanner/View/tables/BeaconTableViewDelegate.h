//
//  BeaconTableViewDelegate.h
//  BeaconScanner
//
//  Created by Johan Haneveld on 2/27/14.
//  Copyright (c) 2014 Idlework. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@protocol BeaconTableViewDelegate

- (void)beaconSelected:(CLBeacon *)beacon;

@end
