#include <Availability.h>

#ifdef __MAC_10_14
#import <objc/NSObject.h>

@interface PRSRankingManager : NSObject
{
    NSDictionary *_groupedResults;
    NSDictionary *_shortcutsDict;
    NSArray *_preferredTopHitGroups;
    NSMutableDictionary *_combinedTopScoreOrder;
    NSMutableDictionary *_combinedBottomScoreOrder;
}

+ (id)getCoreDuetValues;
+ (id)getCoreDuetValuesWhilePossiblyBlocking;
+ (void)fetchDuetValues;
+ (id)quickGlanceBundleIds;
+ (void)addToGlanceCategories:(id)arg1;
@property(retain) NSMutableDictionary *combinedBottomScoreOrder; // @synthesize combinedBottomScoreOrder=_combinedBottomScoreOrder;
@property(retain) NSMutableDictionary *combinedTopScoreOrder; // @synthesize combinedTopScoreOrder=_combinedTopScoreOrder;
@property(retain, nonatomic) NSArray *preferredTopHitGroups; // @synthesize preferredTopHitGroups=_preferredTopHitGroups;
@property(retain, nonatomic) NSDictionary *shortcutsDict; // @synthesize shortcutsDict=_shortcutsDict;
@property(retain, nonatomic) NSDictionary *groupedResults; // @synthesize groupedResults=_groupedResults;
- (void)getRankedCategoriesForQuery:(id)arg1 meanScores:(id)arg2 maxScores:(id)arg3 standardDeviation:(id)arg4 sectionHeaderToBundleIdMapping:(id)arg5 bundleIdToSectionHeaderMapping:(id)arg6 rankingConfiguration:(id)arg7 placements:(id)arg8 topCategories:(id *)arg9 bottomCategories:(id *)arg10 blacklistedCategories:(id *)arg11 sessionIdentifier:(unsigned long long)arg12 logString:(id)arg13 cepsUsed:(id)arg14 poorTextMatchCategories:(id)arg15;
- (void)adjustScoresUsingCategoryEngagement:(id)arg1 forTopScores:(id)arg2 forBottomScores:(id)arg3 query:(id)arg4 logInfo:(id)arg5 usingRankingKnobs:(id)arg6;
- (id)getTopHitsBasedOnCategoryOrder:(id)arg1 groupedResults:(id)arg2 CEPTopHitThreshold:(double)arg3 CEPProbabilityFactor:(double)arg4 topHitCountLimit:(long long)arg5;
- (id)reRankCategories:(id)arg1 groupedResults:(id)arg2;
- (id)chooseTopHitsWithMaxCount:(unsigned long long)arg1 disabledGroups:(id)arg2 topHit:(id)arg3 queryString:(id)arg4 cumulativeTopHitSet:(id)arg5 sortedResults:(id)arg6;
- (BOOL)rankIsMeaningfulForTopHit:(unsigned long long)arg1;
- (id)initWithGroupedResult:(id)arg1 preferredTopHitGroups:(id)arg2 shortcuts:(id)arg3;
- (id)init;

@end

#endif

