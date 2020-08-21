//
//  SPBRankingManagerTests.m
//  SpotlightBridgeTests
//
//  Created by Benjamin Johnson on 17/8/20.
//  Copyright © 2020 Benjamin Johnson. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SPBBridgingSearchResult.h"
#import "SPBTestSearchResult.h"
#import "SPBRankingManager.h"
#import "SPBStandardSearchResult.h"

@interface SPBRankingManagerTests : XCTestCase

@end

@implementation SPBRankingManagerTests

-(void)testInsertSpotlightBridgeCategoriesFromGroupedResultsIntoRankedCategories {
    NSDictionary *groupedResults = @{
        @"SPBLOWESTSCORE": @[
            [self createBridgingSearchResultWithScore:50],
        ],
        @"SPBTOPSCORE": @[
            [self createBridgingSearchResultWithScore:70],
        ],
        @"SPBMIDRANGESCORE": @[
            [self createBridgingSearchResultWithScore:50],
            [self createBridgingSearchResultWithScore:60],
        ]
    };
    
    NSMutableArray *rankedCategories = [NSMutableArray arrayWithArray:@[@"APPLICATIONS", @"DICTIONARY"]];
    
    [SPBRankingManager insertSpotlightBridgeCategoriesFromGroupedResults:groupedResults intoRankedCategories: rankedCategories];
    NSArray *expectedCategories = @[
        @"SPBTOPSCORE",
        @"SPBMIDRANGESCORE",
        @"SPBLOWESTSCORE",
        @"APPLICATIONS",
        @"DICTIONARY"
    ];
    
    XCTAssertTrue([rankedCategories isEqualToArray:expectedCategories]);
}

-(void)testInsertSpotlightBridgeCategoriesFromGroupedResultsIntoRankedCategoriesWithoutSPBResults {
    NSDictionary *groupedResults = @{
        @"NONSPBRESULTS": @[@{}],
     };

    NSMutableArray *rankedCategories = [NSMutableArray arrayWithArray:@[@"APPLICATIONS", @"DICTIONARY"]];
    [SPBRankingManager insertSpotlightBridgeCategoriesFromGroupedResults:groupedResults intoRankedCategories: rankedCategories];
    NSArray *expectedArray = @[@"APPLICATIONS", @"DICTIONARY"];
    XCTAssertTrue([rankedCategories isEqualToArray: expectedArray]);
}

-(void)testChooseTopHitsSortedResults {
    SPBBridgingSearchResult *falseNegativeTopHitResult = [self createBridgingSearchResultWithTopHit:YES];
    SPBBridgingSearchResult *falsePositiveTopHitResult = [self createBridgingSearchResultWithTopHit:NO];
    SPBStandardSearchResult *spotlightSearchResult  = [[SPBStandardSearchResult alloc] initWithContentType:NULL displayName:@""];

    NSArray *originalTopHits = @[
        spotlightSearchResult,
        falsePositiveTopHitResult
    ];
    
    NSArray *topHits = [SPBRankingManager chooseTopHits:originalTopHits sortedResults:@[ falseNegativeTopHitResult ]];
    NSArray *expectedTopHits = @[spotlightSearchResult, falseNegativeTopHitResult];
    XCTAssertTrue([topHits isEqualToArray:expectedTopHits]);
}

-(void)testMergeBridgedResultsWithRankedAndPrunedResults
{
    NSMutableDictionary *rankedAndPrunedResults = [NSMutableDictionary dictionary];
    NSMutableDictionary *resultsByGroupName = [NSMutableDictionary dictionary];
    SPBBridgingSearchResult *result = [self createBridgedSearchResult];
    resultsByGroupName[@"BridgedResults"] = @[
        result
    ];
    [SPBRankingManager mergeBridgeResultsWithRankedAndPrunedResults:rankedAndPrunedResults resultsByGroupName:resultsByGroupName];
    
    XCTAssertTrue([rankedAndPrunedResults[@"BridgedResults"] isEqualToArray:@[result]]);
}

-(SPBBridgingSearchResult*)createBridgingSearchResultWithScore: (float)score {
    SPBTestSearchResult *searchResult = [[SPBTestSearchResult alloc] initWithDisplayName:@""];
    searchResult.score = score;
    
    return [[SPBBridgingSearchResult alloc] initWithSearchResult:searchResult];
}

-(SPBBridgingSearchResult*)createBridgedSearchResult {
    SPBTestSearchResult *searchResult = [[SPBTestSearchResult alloc] initWithDisplayName:@""];
    return [[SPBBridgingSearchResult alloc] initWithSearchResult:searchResult];

}

-(SPBBridgingSearchResult *)createBridgingSearchResultWithTopHit: (BOOL)topHit {
    SPBTestSearchResult *searchResult = [[SPBTestSearchResult alloc] initWithDisplayName:@""];
    searchResult.topHit = topHit;
    return [[SPBBridgingSearchResult alloc] initWithSearchResult:searchResult];
}

@end
