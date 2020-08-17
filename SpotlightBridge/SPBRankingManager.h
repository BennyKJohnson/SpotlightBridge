//
//  SPBRankingManager.h
//  SpotlightBridge
//
//  Created by Benjamin Johnson on 11/8/20.
//  Copyright © 2020 Benjamin Johnson. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SPBRankingManager : NSObject

+ (NSArray *) mergeSpotlightBridgeSectionsFromBundleIdToSectionMapping:(NSDictionary *)bundleIdToSectionMap withRankedSections:(NSArray *)rankedSections;

+ (NSMutableDictionary*)mergeSpotlightBridgeResultsWithRankedAndPrunedResults: (NSMutableDictionary*)rankedAndPrunedResults resultsByGroupName: (NSMutableDictionary*)resultsByGroupName;

+(void)insertSpotlightBridgeCategoriesFromGroupedResults: (NSDictionary*)groupedResults intoRankedCategories:(NSMutableArray*)categories;

@end

NS_ASSUME_NONNULL_END
