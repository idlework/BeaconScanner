//
//  ColorPalette.h
//  BeaconScanner
//
//  Created by Johan Haneveld on 3/3/14.
//  Copyright (c) 2014 Idlework. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ColorPalette : NSObject

+ (UIColor *) colorFromHexCode:(NSString *)hexString;

+ (UIColor *) seaAlgaeGreenColor;
+ (UIColor *) vanillaYoghurtYellowColor;
+ (UIColor *) grapefruitOrangeColor;
+ (UIColor *) wildSalmonRedColor;
+ (UIColor *) plumPurpleColor;
+ (UIColor *) cloudWhiteColor;

+ (UIColor *) blendedColorWithForegroundColor:(UIColor *)foregroundColor backgroundColor:(UIColor *)backgroundColor percentBlend:(CGFloat) percentBlend;

@end
