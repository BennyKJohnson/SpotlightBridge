//
//  SPBRankingManager.m
//  SpotlightBridge
//
//  Created by Benjamin Johnson on 11/8/20.
//  Copyright © 2020 Benjamin Johnson. All rights reserved.
//

#import "SPBRankingManager.h"
#import "SFMutableResultSection.h"
#import "SPBResultSection.h"

@implementation SPBRankingManager

+ (NSArray *) mergeSpotlightBridgeSectionsFromBundleIdToSectionMapping:(NSDictionary *)bundleIdToSectionMap withRankedSections:(NSArray *)rankedSections
{    
    NSArray *spbSections = [self filterSPBSectionsFromResultSections: [bundleIdToSectionMap allValues]];
    
    if (![spbSections count]) {
        return rankedSections;
    }
    
    return [spbSections arrayByAddingObjectsFromArray:rankedSections];
}

+ (NSArray *) filterSPBSectionsFromResultSections:(NSArray *)sections {
    NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(SFMutableResultSection *object, NSDictionary *bindings) {
         return [object domain] == SPBResultSectionDomain;
     }];
     
    return [sections filteredArrayUsingPredicate:predicate];
}

@end
