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

@implementation SPBResultSection (SPBResultSection_SFMutableResultSection)

-(SFMutableResultSection*)createSpotlightResultSection {
    if (![SFMutableResultSection class]) {
        return NULL;
    }
    
    SFMutableResultSection *section = [[SFMutableResultSection alloc]init];
    NSArray *spotlightResults = [self spotlightResults];
    
    [section addResultsFromArray:spotlightResults];
    [section setGroupId:[NSNumber numberWithInt:SPBResultSectionGroupID]];
    [section setGroupName:[self title]];
    [section setDomain: SPBResultSectionDomain];
    
    NSString *bundleIdentifier = self.bundleIdentifier ? self.bundleIdentifier : @"com.spotlightbridge.plugin";
    [section setBundleIdentifier: bundleIdentifier];
    [section setTitle: @"SPBBridge"];
    [section setPinToTop:[self pinToTop]];
    
    return section;
}


@end
#endif
