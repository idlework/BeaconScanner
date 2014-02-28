//
//  BeaconAlert.m
//  BeaconScanner
//
//  Created by Johan Haneveld on 2/25/14.
//  Copyright (c) 2014 Idlework. All rights reserved.
//

#import "BeaconAlert.h"

@implementation BeaconAlert

- (id)initWithBeacon:(CLBeacon *)beacon
{
    NSString *title;
    
    if ([beacon.proximityUUID.UUIDString isEqualToString:EstimoteRegion])
    {
        title = @"Estimote";
    } else if ([beacon.proximityUUID.UUIDString isEqualToString:GimbalRegion])
    {
        title = @"Gimbal";
    } else
    {
        title = @"Generic";
    }
    
    NSString *description = [NSString stringWithFormat:@"UUID: %@\n Major: %@\n Minor: %@\n Accuracy: %.2fm", beacon.proximityUUID.UUIDString, [beacon.major stringValue], [beacon.minor stringValue], beacon.accuracy];
    
    self = [super initWithTitle:title message:description delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
    
    if (self)
    {
        self.titleLabel.textColor = [UIColor cloudsColor];
        self.titleLabel.font = [UIFont boldFlatFontOfSize:16];
        self.messageLabel.textColor = [UIColor cloudsColor];
        self.messageLabel.font = [UIFont flatFontOfSize:14];
        self.backgroundOverlay.backgroundColor = [[UIColor cloudsColor] colorWithAlphaComponent:0.8];
        self.alertContainer.backgroundColor = [UIColor midnightBlueColor];
        self.defaultButtonColor = [UIColor cloudsColor];
        self.defaultButtonShadowColor = [UIColor asbestosColor];
        self.defaultButtonFont = [UIFont boldFlatFontOfSize:16];
        self.defaultButtonTitleColor = [UIColor asbestosColor];
    }
    
    return self;
}

@end
