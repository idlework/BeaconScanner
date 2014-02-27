//
//  BeaconLocationManagerDelegate.h
//  BeaconScanner
//
//  Created by Johan Haneveld on 2/27/14.
//  Copyright (c) 2014 Idlework. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BeaconLocationManagerDelegate

- (void)beaconCollectionUpdated:(NSArray *)beacons;

@end
