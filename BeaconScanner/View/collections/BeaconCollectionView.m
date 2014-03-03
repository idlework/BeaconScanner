//
//  BeaconCollectionView.m
//  BeaconScanner
//
//  Created by Johan Haneveld on 2/28/14.
//  Copyright (c) 2014 Idlework. All rights reserved.
//

#import "BeaconCollectionView.h"

static NSString * const beaconCollectionCellIdentifier = @"BeaconCollectionCell";
static NSString * const beaconCollectionHeaderIdentifier = @"BeaconCollectionHeader";

@implementation BeaconCollectionView

@synthesize beacons = _beacons;
@synthesize collectionView = _collectionView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(154, 154);
        layout.headerReferenceSize = CGSizeMake(312, 40);
        layout.sectionInset = UIEdgeInsetsMake(4, 4, 4, 4);
        layout.minimumInteritemSpacing = 4;
        layout.minimumLineSpacing = 4;
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.allowsMultipleSelection = false;
        _collectionView.backgroundColor = [UIColor cloudsColor];
        [_collectionView registerNib:[UINib nibWithNibName:beaconCollectionCellIdentifier bundle:nil] forCellWithReuseIdentifier:beaconCollectionCellIdentifier];
        [_collectionView registerNib:[UINib nibWithNibName:beaconCollectionHeaderIdentifier bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:beaconCollectionHeaderIdentifier];
        [self addSubview:_collectionView];
    }
    
    return self;
}

#pragma mark - collectionview datasource and delegate handling

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [_collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    CLBeacon *beacon = [self getBeaconByIndexPath:indexPath];
    
    [self.delegate beaconSelected:beacon];
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader)
    {
        BeaconCollectionHeader *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:beaconCollectionHeaderIdentifier forIndexPath:indexPath];
        [headerView setHeaderTitle:[BeaconProximity getProximityByIndex:indexPath.section]];
        reusableview = headerView;
    }
    
    return reusableview;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [_beacons count];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSArray *sectionValues = [_beacons allValues];
    return [[sectionValues objectAtIndex:section] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CLBeacon *beacon = [self getBeaconByIndexPath:indexPath];
    
	BeaconCollectionCell *cell = [_collectionView dequeueReusableCellWithReuseIdentifier:beaconCollectionCellIdentifier forIndexPath:indexPath];
    [cell setBeacon:beacon];
    
    return cell;
}

#pragma mark - data handling

- (CLBeacon *) getBeaconByIndexPath:(NSIndexPath *)indexPath
{
    return [[_beacons allValues] objectAtIndex:indexPath.section][indexPath.row];
}

- (void) setBeacons:(NSMutableDictionary *)beacons
{
    _beacons = beacons;
    
    [_collectionView reloadData];
}

@end
