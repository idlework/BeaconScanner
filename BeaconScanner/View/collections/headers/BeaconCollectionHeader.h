//
//  BeaconCollectionHeader.h
//  BeaconScanner
//
//  Created by Johan Haneveld on 3/3/14.
//  Copyright (c) 2014 Idlework. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ColorPalette.h"

@interface BeaconCollectionHeader : UICollectionReusableView

@property (weak, nonatomic) IBOutlet UIView *background;
@property (weak, nonatomic) IBOutlet UILabel *label;

- (void)setHeaderTitle:(NSString *)title;

@end
