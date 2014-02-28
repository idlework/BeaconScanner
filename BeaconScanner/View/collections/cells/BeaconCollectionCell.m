//
//  BeaconCollectionCell.m
//  BeaconScanner
//
//  Created by Johan Haneveld on 2/28/14.
//  Copyright (c) 2014 Idlework. All rights reserved.
//

#import "BeaconCollectionCell.h"

@implementation BeaconCollectionCell

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        CGRect frame = CGRectMake(0, 0, 154, 154);
        
        self.backgroundView = [[UIView alloc] initWithFrame:frame];
        self.selectedBackgroundView = [[UIView alloc] initWithFrame:frame];
        
        [self setCellStyleWithColor:[UIColor greenSeaColor] selectedColor:[UIColor cloudsColor]];
    }
    
    return self;
}

#pragma mark - data handling

- (void)setBeacon:(CLBeacon *)beacon
{
    self.textLabel.text = [NSString stringWithFormat:@"%@%@", @"ID: ", [beacon.major stringValue]];
    [self setCellStyleWithColor:[UIColor greenSeaColor] selectedColor:[UIColor cloudsColor]];
    [self setImage:beacon.proximityUUID.UUIDString];
}

#pragma mark - cell style handling

- (void) setCellStyleWithColor:(UIColor *)color selectedColor:(UIColor *)selectedColor
{
    self.backgroundView.backgroundColor = color;
    self.selectedBackgroundView.backgroundColor = selectedColor;
    
    //The labels need a clear background color or they will look very funky
    self.textLabel.backgroundColor = [UIColor clearColor];
    
    //Guess some good text colors
    self.textLabel.textColor = selectedColor;
    self.textLabel.highlightedTextColor = color;
}

- (void) setImage:(NSString *)value
{
    UIImage *image;
    
    if ([value isEqualToString:EstimoteRegion])
    {
        image = [UIImage imageNamed:@"Estimote_Beacon.png"];
    } else if ([value isEqualToString:GimbalRegion])
    {
        image = [UIImage imageNamed:@"Gimbal_Beacon.png"];
    } else
    {
        image = [UIImage imageNamed:@"Generic_Beacon.png"];
    }
    
    self.imageView.image = image;
}

@end
