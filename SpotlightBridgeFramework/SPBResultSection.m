//
//  SPBResultSection.m
//  SpotlightBridgeFramework
//
//  Created by Benjamin Johnson on 25/7/20.
//  Copyright © 2020 Benjamin Johnson. All rights reserved.
//

#import "SPBResultSection.h"
#import "SPBSearchResult.h"
#import "SPBBridgingSearchResult.h"

const int SPBResultSectionDomain = 1000;
const int SPBResultSectionGroupID = 8080;

@implementation SPBResultSection

-(instancetype) initWithTitle: (NSString *)title {
    self = [super init];
    if (self) {
        [self setTitle:title];
        [self setPinToTop:NO];
    }
    
    return self;
}

- (NSArray *)spotlightResults {
    NSMutableArray *spotlightResults = [NSMutableArray array];
    
    for (SPBSearchResult *result in self.results) {
        [spotlightResults addObject:[self prepareBridgingSearchResultForResult:result]];
    }
    
    return [spotlightResults copy];
}

-(SPBBridgingSearchResult*)prepareBridgingSearchResultForResult: (SPBSearchResult*)result {
    SPBBridgingSearchResult *spotlightResult = [[SPBBridgingSearchResult alloc]initWithSearchResult:result];
    spotlightResult.sectionName = self.title;
    return spotlightResult;
}

@end
