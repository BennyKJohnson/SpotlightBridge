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
#import "SPBRankingManager.h"

#pragma mark - Swizzles
#pragma mark - SPAppDelegate

hook(SPQueryTask)

+(NSArray*)queryClasses {
    NSArray *extensionQueryClasses = [[[SPBManager sharedInstance] extensionManager] extensionQueryClasses];
    return [ZKOrig(NSArray*) arrayByAddingObjectsFromArray:extensionQueryClasses];
}

endhook

hook(SSRankingManager)

- (id)rankSectionsUsingBundleIDToSectionMapping:(NSDictionary*)arg1 withRanker:(id)arg2 isPeopleSearch:(BOOL)arg3 isScopedAppSearch:(BOOL)arg4 queryId:(unsigned long long)arg5 isCJK:(BOOL)arg6 {
    NSArray *sections = ZKOrig(id, arg1, arg2, arg3, arg4, arg5, arg6);
    return [SPBRankingManager rankSections: sections];
}

endhook

@implementation SPBSpotlightBridge

@end
