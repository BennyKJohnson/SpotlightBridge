//
//  SPBResultSection+SPBResultSearction_SFMutableResultSection.m
//  SpotlightBridgeFramework
//
//  Created by Benjamin Johnson on 27/7/20.
//  Copyright © 2020 Benjamin Johnson. All rights reserved.
//

#import "SPBResultSection+SFMutableResultSection.h"
#include <Availability.h>

#ifdef __MAC_10_15
#import "SFMutableResultSection.h"
#import "SPBBridgingSearchResult.h"

@implementation SPBResultSection (SPBResultSearction_SFMutableResultSection)

-(SFMutableResultSection*)createSpotlightResultSection {
    if (![SFMutableResultSection class]) {
        return NULL;
    }
    
    SFMutableResultSection *section = [[SFMutableResultSection alloc]init];
    NSMutableArray *spotlightResults = [NSMutableArray array];
    
    for (SPBSearchResult *result in self.results) {
        SPBBridgingSearchResult *spotlightResult = [[SPBBridgingSearchResult alloc]initWithSearchResult:result];
        [spotlightResults addObject:spotlightResult];
    }
    
    [section addResultsFromArray:[spotlightResults copy]];
    [section setGroupId:[NSNumber numberWithInt:14]];
    [section setGroupName:[self title]];
    [section setDomain:4];
    [section setBundleIdentifier:@"com.apple.calculator"];
    [section setTitle: @"MENU_EXPRESSION"];
    
    return section;
}


@end
#endif
