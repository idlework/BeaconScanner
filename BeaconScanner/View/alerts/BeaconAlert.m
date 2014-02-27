//
//  BeaconAlert.m
//  BeaconScanner
//
//  Created by Johan Haneveld on 2/25/14.
//  Copyright (c) 2014 Idlework. All rights reserved.
//

#import "BeaconAlert.h"

@implementation BeaconAlert

@synthesize beacon = _beacon;

- (id)initWithBeacon:(CLBeacon *)beacon
{
    _beacon = beacon;
    
    self = [super initWithTitle:@"Hello" message:@"This is an alert view" delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
    
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
