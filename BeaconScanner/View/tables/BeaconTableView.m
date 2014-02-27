//
//  BeaconTableView.m
//  BeaconScanner
//
//  Created by Johan Haneveld on 2/26/14.
//  Copyright (c) 2014 Idlework. All rights reserved.
//

#import "BeaconTableView.h"

static NSString * const beaconCellIdentifier = @"BeaconCell";
static NSString * const beaconHeaderIdentifier = @"BeaconHeader";

@implementation BeaconTableView

@synthesize beacons = _beacons;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        self.delegate = self;
        self.dataSource = self;
        
        //Set the separator color
        self.separatorColor = [UIColor cloudsColor];
        
        //Set the background color
        self.backgroundColor = [UIColor cloudsColor];
        self.backgroundView = nil;
    }
    
    return self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CLBeacon *beacon = _beacons[indexPath.row];
    
    UITableViewCell *cell = [UITableViewCell configureFlatCellWithColor:[UIColor greenSeaColor] selectedColor:[UIColor cloudsColor] reuseIdentifier:beaconCellIdentifier inTableView:(UITableView *)tableView];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:beaconCellIdentifier];
        [cell configureFlatCellWithColor:[UIColor greenSeaColor] selectedColor:[UIColor cloudsColor]];
    }
    
    cell.cornerRadius = 5.0f;
    cell.textLabel.text = beacon.debugDescription;
    
//    cell.detailTextLabel.text = [beacon.major stringValue];
//    cell.textLabel.text = beacon.proximityUUID.UUIDString;
//    cell.detailTextLabel.text = [self
//    cell.detailTextLabel.textColor = [UIColor grayColor];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _beacons.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 60;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    // Adds an activity indicator view to the section header
    UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    indicatorView.frame = (CGRect){(CGPoint){205, 25}, indicatorView.frame.size};
    indicatorView.backgroundColor = [UIColor cloudsColor];
    [indicatorView startAnimating];
    
    UITableViewHeaderFooterView *headerView = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:beaconHeaderIdentifier];
    headerView.contentView.backgroundColor = [UIColor cloudsColor];
    headerView.textLabel.text = @"Looking for beacons...";
    headerView.textLabel.frame = (CGRect){(CGPoint){0, 35}, headerView.frame.size};
    [headerView addSubview:indicatorView];
    
    return headerView;
}

-(void) setBeacons:(NSArray *)beacons
{
    _beacons = beacons;
    
    [self reloadData];
}

@end
