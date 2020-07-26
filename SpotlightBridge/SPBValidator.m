//
//  SPBValidator.m
//  SpotlightBridge
//
//  Created by Benjamin Johnson on 26/7/20.
//  Copyright © 2020 Benjamin Johnson. All rights reserved.
//

#import "SPBValidator.h"

@implementation SPBValidator

+(BOOL)performRealityCheck
{
    Class spotlighQueryClass = NSClassFromString(@"SPKQuery");
    if (!spotlighQueryClass) {
        return NO;
    }
    
    if (![spotlighQueryClass respondsToSelector: NSSelectorFromString(@"isQuerySupported:")]) {
        return NO;
    }
    
    Class spotlightQueryTask = NSClassFromString(@"SPQueryTask");
    if (!spotlightQueryTask) {
        return NO;
    }
    
    if (![spotlightQueryTask respondsToSelector:NSSelectorFromString(@"queryClasses")]) {
        return NO;
    }
    
    return YES;
}

@end
