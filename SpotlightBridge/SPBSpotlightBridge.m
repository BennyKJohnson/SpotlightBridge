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
#import "PRSRankingManager.h"
#include <Availability.h>

#pragma mark - Swizzles
#pragma mark - SPAppDelegate

hook(SPQueryTask)
/*
 Injects the query classes for each loaded extensions into the query classes return value. When included, Spotlight will alloc and init them and proceed to call the query method on the instances of the query classes. This is the main entry point that makes Spotlight Bridge possible.
 */
+(NSArray*)queryClasses {
    NSArray *extensionQueryClasses = [[[SPBManager sharedInstance] extensionManager] extensions];
    return [ZKOrig(NSArray*) arrayByAddingObjectsFromArray:extensionQueryClasses];
}

endhook

#pragma mark Hooks for Catalina
#ifdef __MAC_10_15

hook(SSRankingManager)
/* Inserts the Spotlight Bridge sections with the default spotlight sections in the desired ordering */
- (id)rankSectionsUsingBundleIDToSectionMapping:(NSDictionary*)arg1 withRanker:(id)arg2 isPeopleSearch:(BOOL)arg3 isScopedAppSearch:(BOOL)arg4 queryId:(unsigned long long)arg5 isCJK:(BOOL)arg6 {
    NSArray *rankedSections = ZKOrig(id, arg1, arg2, arg3, arg4, arg5, arg6);
    return [SPBRankingManager mergeSpotlightBridgeSectionsFromBundleIdToSectionMapping:arg1 withRankedSections:rankedSections];
}

endhook

#endif

#pragma mark Hooks for Mojave
#ifdef __MAC_10_14

hook(SPQueryTask)

-(id)rankAndPrune:(NSMutableDictionary*)resultsByGroupName maxResults:(unsigned long long)arg3 parsecResultCategories:(id)arg4 topHitCategory:(id)arg5 totalResultCount:(long long *)arg6 query:(id)arg7 {
    NSMutableDictionary *result =  ZKOrig(id, resultsByGroupName, arg3, arg4, arg5,arg6,arg7);
    return [SPBRankingManager mergeSpotlightBridgeResultsWithRankedAndPrunedResults:result resultsByGroupName:resultsByGroupName];
}

endhook

hook(PRSRankingManager)

/* Required to ensure the Spotlight Bridge grouped results will be included with the final results in the preferred arrangement */
- (void)getRankedCategoriesForQuery:(id)arg1 meanScores:(id)meanScores maxScores:(id)arg3 standardDeviation:(id)arg4 sectionHeaderToBundleIdMapping:(id)arg5 bundleIdToSectionHeaderMapping:(id)arg6 rankingConfiguration:(id)arg7 placements:(id)arg8 topCategories:(id *)topCategoriesPtr bottomCategories:(id *)arg10 blacklistedCategories:(id *)arg11 sessionIdentifier:(unsigned long long)arg12 logString:(id)arg13 cepsUsed:(id)arg14 poorTextMatchCategories:(id)arg15 {
    ZKOrig(void, arg1, meanScores, arg3, arg4, arg5, arg6, arg7, arg8, topCategoriesPtr, arg10, arg11, arg12, arg13, arg14, arg15);
    
    PRSRankingManager *rankingManager = (PRSRankingManager *)self;
    
    NSMutableArray *topCategories = *topCategoriesPtr;
    NSDictionary *groupedResults = [rankingManager groupedResults];
    
    [SPBRankingManager insertSpotlightBridgeCategoriesFromGroupedResults:groupedResults intoRankedCategories:topCategories];
}

/* Ensures that Spotlight respects the top hit setting on the spotlight bridge result */
- (id)chooseTopHitsWithMaxCount:(unsigned long long)arg1 disabledGroups:(id)arg2 topHit:(id)arg3 queryString:(id)arg4 cumulativeTopHitSet:(id)arg5 sortedResults:(id)arg6 {
    NSArray *topHits = ZKOrig(id, arg1, arg2, arg3, arg4, arg5, arg6);
    return [SPBRankingManager chooseTopHits:topHits sortedResults:arg6];
}

endhook

#endif

@implementation SPBSpotlightBridge

@end
