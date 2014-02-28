//
//  BeaconTableView.h
//  BeaconScanner
//
//  Created by Johan Haneveld on 2/26/14.
//  Copyright (c) 2014 Idlework. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <FlatUIKit.h>

//#import "BeaconLocationManagerDelegate.h"

@interface BeaconTableView : UITableView <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *beacons;

@end
