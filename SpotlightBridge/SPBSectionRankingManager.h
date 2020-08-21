#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SPBSectionRankingManager : NSObject

+ (NSArray *) mergeSpotlightBridgeSectionsFromBundleIdToSectionMapping:(NSDictionary *)bundleIdToSectionMap withRankedSections:(NSArray *)rankedSections;

@end

NS_ASSUME_NONNULL_END
