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
#import "BeaconCollectionView.h"
#import "BeaconAlert.h"

@interface MainViewController : UIViewController <CLLocationManagerDelegate, BeaconLocationManagerDelegate, BeaconCollectionViewDelegate>

@property (strong, nonatomic) BeaconLocationManager *beaconLocationManager;
@property (strong, nonatomic) BeaconCollectionView *beaconCollection;

@end
