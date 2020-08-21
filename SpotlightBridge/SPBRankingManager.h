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

+ (NSMutableDictionary*)mergeBridgeResultsWithRankedAndPrunedResults: (NSMutableDictionary*)rankedAndPrunedResults resultsByGroupName: (NSMutableDictionary*)resultsByGroupName;

+(void)insertSpotlightBridgeCategoriesFromGroupedResults: (NSDictionary*)groupedResults intoRankedCategories:(NSMutableArray*)categories;

+(NSArray*)chooseTopHits: (NSArray *)topHits sortedResults: (id)results;

+(float)getMaxScoreForResults:(NSArray*)results;

@end

NS_ASSUME_NONNULL_END
