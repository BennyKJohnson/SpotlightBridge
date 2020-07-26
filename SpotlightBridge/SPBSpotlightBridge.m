//
//  SPBSpotlightBridge.m
//  SpotlightBridge
//
//  Created by Benjamin Johnson on 11/7/20.
//  Copyright © 2020 Benjamin Johnson. All rights reserved.
//

#import "SPBSpotlightBridge.h"
#import "ZKSwizzle.h"
#import "SPBManager.h"

#pragma mark - Swizzles
#pragma mark - SPAppDelegate

hook(SPQueryTask)

+(NSArray*)queryClasses {
    NSArray *extensionQueryClasses = [[[SPBManager sharedInstance] extensionManager] extensionQueryClasses];
    return [ZKOrig(NSArray*) arrayByAddingObjectsFromArray:extensionQueryClasses];
}

endhook

@implementation SPBSpotlightBridge

@end
