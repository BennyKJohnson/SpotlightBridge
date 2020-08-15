//
//  SPBResultSection.m
//  SpotlightBridgeFrameworkTests
//
//  Created by Benjamin Johnson on 15/8/20.
//  Copyright © 2020 Benjamin Johnson. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <SpotlightBridge/SpotlightBridge.h>
#import "SPBResultSection+SFMutableResultSection.h"
#import "SFMutableResultSection.h"
#import "SPBBridgingSearchResult.h"

@interface SPBResultSectionTests : XCTestCase

@end

@implementation SPBResultSectionTests

-(void)testCreateSpotlightResultSection {
    SPBResultSection *section = [[SPBResultSection alloc]initWithTitle:@"my title"];
    section.pinToTop = NO;
    section.bundleIdentifier = @"com.test";
    
    SFMutableResultSection *sfResultSection = [section createSpotlightResultSection];
    
    XCTAssertTrue([sfResultSection.groupName isEqualToString: @"my title"]);
    XCTAssertTrue([sfResultSection.bundleIdentifier isEqualToString:@"com.test"]);
    XCTAssertTrue([sfResultSection.groupId isEqualToNumber:[NSNumber numberWithInt:SPBResultSectionGroupID]]);
    XCTAssertTrue([sfResultSection.title isEqualToString:@"SPBBridge"]);
    XCTAssertFalse(sfResultSection.pinToTop);
}

-(void)testCreateSpotlightResultSectionWithResults {
    SPBResultSection *section = [[SPBResultSection alloc]initWithTitle:@"my title"];
    SPBSearchResult *dogSearchResult = [[SPBSearchResult alloc] initWithDisplayName:@"dog"];
    SPBSearchResult *catSearchResult = [[SPBSearchResult alloc] initWithDisplayName:@"cat"];
    NSArray *searchResults = @[dogSearchResult, catSearchResult];
    section.results = searchResults;
    
    SFMutableResultSection *sfResultSection = [section createSpotlightResultSection];
    XCTAssertEqual([sfResultSection.results count], [searchResults count]);
    
    for (int i = 0; i < [section.results count]; i++) {
        SPBSearchResult *searchResult = searchResults[i];
        SPBBridgingSearchResult *bridgingSearchResult = sfResultSection.results[i];
        
        XCTAssertEqual(bridgingSearchResult.searchResult, searchResult);
    }
}

@end
