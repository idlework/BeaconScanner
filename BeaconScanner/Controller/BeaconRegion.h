//
//  BeaconRegion.h
//  BeaconScanner
//
//  Created by Johan Haneveld on 2/26/14.
//  Copyright (c) 2014 Idlework. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

@interface BeaconRegion : CLBeaconRegion

- (id)initWithIdentifier:(NSString *)identifier;

@end
