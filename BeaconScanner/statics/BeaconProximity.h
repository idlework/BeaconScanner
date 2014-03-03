//
//  BeaconProximity.h
//  BeaconScanner
//
//  Created by Johan Haneveld on 3/3/14.
//  Copyright (c) 2014 Idlework. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface BeaconProximity : NSObject

+ (NSString *)getProximityByIndex:(int)index;

@end
