//
//  BeaconCollectionView.m
//  BeaconScanner
//
//  Created by Johan Haneveld on 2/28/14.
//  Copyright (c) 2014 Idlework. All rights reserved.
//

#import "BeaconCollectionView.h"

static NSString * const beaconCollectionCellIdentifier = @"BeaconCollectionCell";

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
        layout.sectionInset =UIEdgeInsetsMake(4, 4, 4, 4);
        layout.minimumInteritemSpacing = 4;
        layout.minimumLineSpacing = 4;
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.allowsMultipleSelection = false;
        _collectionView.backgroundColor = [UIColor cloudsColor];
        [_collectionView registerNib:[UINib nibWithNibName:beaconCollectionCellIdentifier bundle:nil] forCellWithReuseIdentifier:beaconCollectionCellIdentifier];
        [self addSubview:_collectionView];
    }
    
    return self;
}

#pragma mark - collectionview datasource and delegate handling

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [_collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    [self.delegate beaconSelected:_beacons[indexPath.row]];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_beacons count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
	BeaconCollectionCell *cell = [_collectionView dequeueReusableCellWithReuseIdentifier:beaconCollectionCellIdentifier forIndexPath:indexPath];
    [cell setBeacon:[_beacons objectAtIndex:[indexPath row]]];
    
    return cell;
}

#pragma mark - data handling

-(void) setBeacons:(NSArray *)beacons
{
    _beacons = beacons;
    
    [_collectionView reloadData];
}

@end
