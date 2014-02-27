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
@synthesize beaconTable = _beaconTable;

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
    
    _beaconTable = [[BeaconTableView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:_beaconTable];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - beacon detail alert

- (void)showAlertViewByBeacon:(CLBeacon *)beacon;
{
    
}

#pragma mark - BeaconLocationManager delegates

- (void)beaconCollectionUpdated:(NSArray *)beacons
{
    _beaconTable.beacons = beacons;
}

#pragma mark - BeaconTableView delegates

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    BeaconAlert *alert = [[BeaconAlert alloc] initWithBeacon:_beaconTable.beacons[indexPath.row]];
//    [alert show];
//}

@end
