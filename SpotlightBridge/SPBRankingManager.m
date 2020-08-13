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

+ (NSArray *) mergeSpotlightBridgeSectionsFromBundleIdToSectionMapping:(NSDictionary *)bundleIdToSectionMap withRankedSections:(NSArray *)rankedSections
{    
    NSArray *spbSections = [self filterSPBSectionsFromResultSections: [bundleIdToSectionMap allValues]];
    if (![spbSections count]) {
        return rankedSections;
    }
    
    NSArray *spbRankedSections = [self rankSpotlightBridgeSections:spbSections];
    
    return [spbRankedSections arrayByAddingObjectsFromArray:rankedSections];
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

+(NSMutableDictionary*)scoreMapForSections: (NSArray *)sections {
    NSMutableDictionary *scoreMap = [NSMutableDictionary dictionary];
    for (SFMutableResultSection *section in sections) {
        float score = [self getScoreForResultSection:section];
        scoreMap[section.bundleIdentifier] = [NSNumber numberWithFloat: score];
    }
    
    return scoreMap;
}

+(float)getScoreForResultSection: (SFMutableResultSection*)section {
    float maxScore = 0;
    for (SPBBridgingSearchResult *result in section.results) {
        if ([result.searchResult score] > maxScore) {
            maxScore = [result.searchResult score] / [result.searchResult maxScore];
        }
    }
    
    return maxScore;
}

@end
