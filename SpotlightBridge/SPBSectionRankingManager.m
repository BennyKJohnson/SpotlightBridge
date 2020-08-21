#import "SPBSectionRankingManager.h"
#import "SFMutableResultSection.h"
#import "SPBResultSection.h"
#import "SPBRankingManager.h"

@implementation SPBSectionRankingManager

+ (NSArray *)mergeSpotlightBridgeSectionsFromBundleIdToSectionMapping:(NSDictionary *)bundleIdToSectionMap withRankedSections:(NSArray *)rankedSections
{
    NSArray *spbSections = [self filterSPBSectionsFromResultSections: [bundleIdToSectionMap allValues]];
    if (![spbSections count]) {
        return rankedSections;
    }
    
    NSArray *spbRankedSections = [self rankSpotlightBridgeSections:spbSections];
    
    return [spbRankedSections arrayByAddingObjectsFromArray:rankedSections];
}

+ (NSArray *)filterSPBSectionsFromResultSections:(NSArray *)sections {
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
        float score = [SPBRankingManager getMaxScoreForResults:section.results];
        scoreMap[section.bundleIdentifier] = [NSNumber numberWithFloat: score];
    }
    
    return scoreMap;
}


@end
