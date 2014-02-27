//
//  BeaconAlert.h
//  BeaconScanner
//
//  Created by Johan Haneveld on 2/25/14.
//  Copyright (c) 2014 Idlework. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import <FlatUIKit.h>

@interface BeaconAlert : FUIAlertView

@property (weak, nonatomic) CLBeacon *beacon;

- (id)initWithBeacon:(CLBeacon *)beacon;

@end
