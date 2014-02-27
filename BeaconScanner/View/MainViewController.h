//
//  MainViewController.h
//  BeaconScanner
//
//  Created by Johan Haneveld on 2/25/14.
//  Copyright (c) 2014 Idlework. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FlatUIKit.h>
#import <CoreLocation/CoreLocation.h>

#import "BeaconLocationManagerDelegate.h"
#import "BeaconLocationManager.h"
#import "BeaconTableView.h"
#import "BeaconAlert.h"

@interface MainViewController : UIViewController <CLLocationManagerDelegate, BeaconLocationManagerDelegate>

@property (strong, nonatomic) BeaconLocationManager *beaconLocationManager;
@property (strong, nonatomic) BeaconTableView *beaconTable;

- (void)showAlertViewByBeacon:(CLBeacon *)beacon;

@end
