//
//  BeaconCollectionViewDelegate.h
//  BeaconScanner
//
//  Created by Johan Haneveld on 2/28/14.
//  Copyright (c) 2014 Idlework. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

@protocol BeaconCollectionViewDelegate

- (void)beaconSelected:(CLBeacon *)beacon;

@end