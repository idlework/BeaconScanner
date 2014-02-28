//
//  BeaconCollectionCell.h
//  BeaconScanner
//
//  Created by Johan Haneveld on 2/28/14.
//  Copyright (c) 2014 Idlework. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

#import "FUICellBackgroundView.h"
#import "UIColor+FlatUI.h"
#import "BeaconRegions.h"

@interface BeaconCollectionCell : UICollectionViewCell

@property (strong, nonatomic) CLBeacon *beacon;

//@property (nonatomic) CGFloat cornerRadius;
//@property (nonatomic) CGFloat separatorHeight;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

- (void) setCellStyleWithColor:(UIColor *)color selectedColor:(UIColor *)selectedColor;

//- (void)setCornerRadius:(CGFloat)cornerRadius;
//- (void)setSeparatorHeight:(CGFloat)separatorHeight;

@end
