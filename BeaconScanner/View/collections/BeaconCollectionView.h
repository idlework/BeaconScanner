//
//  BeaconCollectionView.h
//  BeaconScanner
//
//  Created by Johan Haneveld on 2/28/14.
//  Copyright (c) 2014 Idlework. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BeaconCollectionViewDelegate.h"
#import "BeaconCollectionCell.h"
#import "UIColor+FlatUI.h"

@interface BeaconCollectionView : UIView <UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) id<BeaconCollectionViewDelegate> delegate;

@property (strong, nonatomic) NSArray *beacons;
@property (strong, nonatomic) UICollectionView *collectionView;

@end
