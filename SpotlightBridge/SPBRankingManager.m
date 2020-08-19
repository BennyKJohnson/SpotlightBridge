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
#import "SPBBridgingSearchResult.h"

@implementation SPBRankingManager

// Required for Mojave. Remove this method once it is known why bridged results are thrown out in the rankAndPrune method
+ (NSMutableDictionary*)mergeSpotlightBridgeResultsWithRankedAndPrunedResults: (NSMutableDictionary*)rankedAndPrunedResults resultsByGroupName: (NSMutableDictionary*)resultsByGroupName {
    NSMutableArray *spotlightBridgeGroupKeys = [NSMutableArray array];
    
    for (NSString * groupName in [resultsByGroupName allKeys]) {
        if ([resultsByGroupName[groupName] count]) {
            id firstResultOfGroup = resultsByGroupName[groupName][0];
            if ([firstResultOfGroup isKindOfClass:[SPBBridgingSearchResult class]]) {
                [spotlightBridgeGroupKeys addObject:groupName];
            }
        }
    }
    
    for (NSString *spotlightBridgeGroupName in spotlightBridgeGroupKeys) {
        NSArray *results = resultsByGroupName[spotlightBridgeGroupName];
        
        int maximumNumberOfResultsPerGroup = 5;
        int numberOfItemsToInclude = MIN((int)[results count], maximumNumberOfResultsPerGroup);
        rankedAndPrunedResults[spotlightBridgeGroupName] = [results subarrayWithRange:NSMakeRange(0, numberOfItemsToInclude)];
    }
    
    return rankedAndPrunedResults;
}

+ (NSArray *) mergeSpotlightBridgeSectionsFromBundleIdToSectionMapping:(NSDictionary *)bundleIdToSectionMap withRankedSections:(NSArray *)rankedSections
{    
    NSArray *spbSections = [self filterSPBSectionsFromResultSections: [bundleIdToSectionMap allValues]];
    if (![spbSections count]) {
        return rankedSections;
    }
    
    NSArray *spbRankedSections = [self rankSpotlightBridgeSections:spbSections];
    
    return [spbRankedSections arrayByAddingObjectsFromArray:rankedSections];
}

+(void)insertSpotlightBridgeCategoriesFromGroupedResults: (NSDictionary*)groupedResults intoRankedCategories:(NSMutableArray*)categories {
    NSMutableArray *spbCategories = [self getSortedSpotlightBridgeCategoriesFromGroupResults:groupedResults];
    
    [categories removeObjectsInArray:spbCategories];
    NSIndexSet *insertAtStartIndexSet = [NSIndexSet indexSetWithIndexesInRange: NSMakeRange(0, [spbCategories count])];
    [categories insertObjects:spbCategories atIndexes:insertAtStartIndexSet];
}

+(NSArray*)chooseTopHits: (NSArray *)topHits sortedResults: (id)results {
    NSMutableArray *newTopHits = [NSMutableArray arrayWithArray:topHits];
    [self removeMisclassifiedBridgedResultsFromTopHits:newTopHits];
    [self insertTopHitBridgedResultsFromResults:results intoTopHits:newTopHits];
    
    return [newTopHits copy];
}

+(void)removeMisclassifiedBridgedResultsFromTopHits:(NSMutableArray*)topHits {
    NSMutableArray *unsuitableResultsForTopHits = [NSMutableArray array];
    for (id result in topHits) {
        if ([result isKindOfClass: [SPBBridgingSearchResult class]]) {
            SPBBridgingSearchResult *spbResult = (SPBBridgingSearchResult*)result;
            if (![spbResult.searchResult isTopHit]) {
                [unsuitableResultsForTopHits addObject: spbResult];
            }
        }
    }
    
    [topHits removeObjectsInArray:unsuitableResultsForTopHits];
}

+(void)insertTopHitBridgedResultsFromResults: (NSArray*)sortedResults intoTopHits: (NSMutableArray *)topHits {
    NSMutableArray *bridgedTopHits = [NSMutableArray array];
    for (id result in sortedResults) {
        if ([result isKindOfClass:[SPBBridgingSearchResult class]]) {
            SPBBridgingSearchResult *bridgedResult = (SPBBridgingSearchResult*)result;
            if (bridgedResult.searchResult.isTopHit && ![topHits containsObject:bridgedResult]) {
                [bridgedTopHits addObject:bridgedResult];
            }
        }
    }
    
    [topHits addObjectsFromArray:bridgedTopHits];
}

+(NSMutableArray*)getSortedSpotlightBridgeCategoriesFromGroupResults: (NSDictionary*)groupedResults {
    NSDictionary *spotlightBridgeGroupedResults = [self filterSpotbridgeResultsFromGroupedResults: groupedResults];
    NSMutableArray *spotlightBridgeCategories = [NSMutableArray arrayWithArray:[spotlightBridgeGroupedResults allKeys]];
    
    NSMutableDictionary *scoreMap = [self scoreMapForGroupedResults:spotlightBridgeGroupedResults];
    [spotlightBridgeCategories sortUsingComparator:^NSComparisonResult(id  _Nonnull first, id  _Nonnull second) {
        return [scoreMap[second] compare: scoreMap[first]];
    }];
    
    return spotlightBridgeCategories;
}

+(NSDictionary*)filterSpotbridgeResultsFromGroupedResults: (NSDictionary *)groupedResults {
    NSMutableDictionary *spotlightBridgeGroupedResults = [NSMutableDictionary dictionary];
    for (NSString *category in [groupedResults allKeys]) {
        if ([groupedResults[category] count]) {
            id result = [groupedResults[category] firstObject];
            if ([result isKindOfClass:[SPBBridgingSearchResult class]]) {
                spotlightBridgeGroupedResults[category] = groupedResults[category];
            }
        }
    }
    
    return [spotlightBridgeGroupedResults copy];
}

+ (NSArray *) filterSPBSectionsFromResultSections:(NSArray *)sections {
    NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(SFMutableResultSection *object, NSDictionary *bindings) {
        return [object domain] == SPBResultSectionDomain;
    }];
    
    return [sections filteredArrayUsingPredicate:predicate];
}

+(NSArray *)rankSpotlightBridgeSections: (NSArray *)sections {
    NSMutableDictionary *scoreMap = [self scoreMapForSections:sections];
    
    return [sections sortedArrayUsingComparator:^NSComparisonResult(SFMutableResultSection *a, SFMutableResultSection *b) {
        NSNumber *firstSectionScore = scoreMap[a.bundleIdentifier];
        NSNumber *secondSectionScore = scoreMap[b.bundleIdentifier];
        
        return [secondSectionScore compare: firstSectionScore];
    }];
}

+(NSMutableDictionary*)scoreMapForGroupedResults: (NSDictionary*)groupedResults {
    NSMutableDictionary *scoreMap = [NSMutableDictionary dictionary];
    for(NSString *category in [groupedResults allKeys]) {
        float score = [self getMaxScoreForResults:groupedResults[category]];
        scoreMap[category] = [NSNumber numberWithFloat:score];
    }
    
    return scoreMap;
}

+(NSMutableDictionary*)scoreMapForSections: (NSArray *)sections {
    NSMutableDictionary *scoreMap = [NSMutableDictionary dictionary];
    for (SFMutableResultSection *section in sections) {
        float score = [self getMaxScoreForResults:section.results];
        scoreMap[section.bundleIdentifier] = [NSNumber numberWithFloat: score];
    }
    
    return scoreMap;
}

+(float)getMaxScoreForResults:(NSArray*)results {
    float maxScore = 0;
    for (SPBBridgingSearchResult *result in results) {
        if ([result.searchResult score] > maxScore) {
            maxScore = [result.searchResult score] / [result.searchResult maxScore];
        }
    }
    
    return maxScore;
}

@end
