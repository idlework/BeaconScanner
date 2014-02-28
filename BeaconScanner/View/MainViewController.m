//
//  MainViewController.m
//  BeaconScanner
//
//  Created by Johan Haneveld on 2/25/14.
//  Copyright (c) 2014 Idlework. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

@synthesize beaconLocationManager = _beaconLocationManager;
@synthesize beaconCollection = _beaconCollection;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self)
    {
    }
    
    return self;
}

#pragma mark - view handling

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _beaconLocationManager = [[BeaconLocationManager alloc] init];
    _beaconLocationManager.delegate = self;
    
    _beaconCollection = [[BeaconCollectionView alloc] initWithFrame:self.view.frame];
    _beaconCollection.delegate = self;
    [self.view addSubview:_beaconCollection];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - BeaconLocationManager delegates

- (void)beaconCollectionUpdated:(NSArray *)beacons
{
    _beaconCollection.beacons = beacons;
}

#pragma mark - BeaconCollectionView delegates

- (void)beaconSelected:(CLBeacon *)beacon
{
    BeaconAlert *alert = [[BeaconAlert alloc] initWithBeacon:beacon];
    [alert show];
}

@end
