//
//  ColorPalette.m
//  BeaconScanner
//
//  Created by Johan Haneveld on 3/3/14.
//  Copyright (c) 2014 Idlework. All rights reserved.
//

#import "ColorPalette.h"

@implementation ColorPalette

// Thanks to: http://stackoverflow.com/questions/3805177/how-to-convert-hex-rgb-color-codes-to-uicolor
+ (UIColor *) colorFromHexCode:(NSString *)hexString
{
    NSString *cleanString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    
    if ([cleanString length] == 3)
    {
        cleanString = [NSString stringWithFormat:@"%@%@%@%@%@%@",
                       [cleanString substringWithRange:NSMakeRange(0, 1)],[cleanString substringWithRange:NSMakeRange(0, 1)],
                       [cleanString substringWithRange:NSMakeRange(1, 1)],[cleanString substringWithRange:NSMakeRange(1, 1)],
                       [cleanString substringWithRange:NSMakeRange(2, 1)],[cleanString substringWithRange:NSMakeRange(2, 1)]];
    }
    
    if([cleanString length] == 6)
    {
        cleanString = [cleanString stringByAppendingString:@"ff"];
    }
    
    unsigned int baseValue;
    
    [[NSScanner scannerWithString:cleanString] scanHexInt:&baseValue];
    
    float red = ((baseValue >> 24) & 0xFF)/255.0f;
    float green = ((baseValue >> 16) & 0xFF)/255.0f;
    float blue = ((baseValue >> 8) & 0xFF)/255.0f;
    float alpha = ((baseValue >> 0) & 0xFF)/255.0f;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

// Thanks to: https://kuler.adobe.com/camouflage-color-theme-3449716/
+ (UIColor *) seaAlgaeGreenColor
{
    return [ColorPalette colorFromHexCode:@"1B5257"];
}

+ (UIColor *) vanillaYoghurtYellowColor
{
    return [ColorPalette colorFromHexCode:@"F7F6C3"];
}

+ (UIColor *) grapefruitOrangeColor
{
    return [ColorPalette colorFromHexCode:@"F28159"];
}

+ (UIColor *) wildSalmonRedColor
{
    return [ColorPalette colorFromHexCode:@"CC5850"];
}

+ (UIColor *) plumPurpleColor
{
    return [ColorPalette colorFromHexCode:@"4F1C2E"];
}

+ (UIColor *) cloudWhiteColor
{
    return [ColorPalette colorFromHexCode:@"ECF0F1"];
}

+ (UIColor *) blendedColorWithForegroundColor:(UIColor *)foregroundColor backgroundColor:(UIColor *)backgroundColor percentBlend:(CGFloat) percentBlend
{
    CGFloat onRed, offRed, newRed, onGreen, offGreen, newGreen, onBlue, offBlue, newBlue, onWhite, offWhite;
    
    if ([foregroundColor getWhite:&onWhite alpha:nil])
    {
        onRed = onWhite;
        onBlue = onWhite;
        onGreen = onWhite;
    } else
    {
        [foregroundColor getRed:&onRed green:&onGreen blue:&onBlue alpha:nil];
    }
    
    if ([backgroundColor getWhite:&offWhite alpha:nil])
    {
        offRed = offWhite;
        offBlue = offWhite;
        offGreen = offWhite;
    } else
    {
        [backgroundColor getRed:&offRed green:&offGreen blue:&offBlue alpha:nil];
    }
    
    newRed = onRed * percentBlend + offRed * (1 - percentBlend);
    newGreen = onGreen * percentBlend + offGreen * (1 - percentBlend);
    newBlue = onBlue * percentBlend + offBlue * (1 - percentBlend);
    
    return [UIColor colorWithRed:newRed green:newGreen blue:newBlue alpha:1.0];
}

@end
