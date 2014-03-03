//
//  BeaconProximity.m
//  BeaconScanner
//
//  Created by Johan Haneveld on 3/3/14.
//  Copyright (c) 2014 Idlework. All rights reserved.
//

#import "BeaconProximity.h"

@implementation BeaconProximity

+ (NSString *)getProximityByIndex:(int)index
{
    NSString *title = nil;
    
    switch(index)
    {
        case CLProximityImmediate:
        {
            title = @"Immediate";
            break;
        }
        case CLProximityNear:
        {
            title = @"Near";
            break;
        }
        case CLProximityFar:
        {
            title = @"Far";
            break;
        }
        default:
        {
            title = @"Unknown";
            break;
        }
    }
    
    return title;
}

@end
