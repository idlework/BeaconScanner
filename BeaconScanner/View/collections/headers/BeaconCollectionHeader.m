//
//  BeaconCollectionHeader.m
//  BeaconScanner
//
//  Created by Johan Haneveld on 3/3/14.
//  Copyright (c) 2014 Idlework. All rights reserved.
//

#import "BeaconCollectionHeader.h"

@implementation BeaconCollectionHeader

@synthesize label = _label;
@synthesize background = _background;

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
    }
    
    return self;
}

- (void)setHeaderTitle:(NSString *)title
{
    _label.text = title;
    _label.backgroundColor = [UIColor clearColor];
    _label.textColor = [ColorPalette plumPurpleColor];
    _background.backgroundColor = [ColorPalette vanillaYoghurtYellowColor];
}

@end
