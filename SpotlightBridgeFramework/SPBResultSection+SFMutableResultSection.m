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

@implementation SPBResultSection (SPBResultSearction_SFMutableResultSection)

-(SFMutableResultSection*)createSpotlightResultSection {
    if (![SFMutableResultSection class]) {
        return NULL;
    }
    
    SFMutableResultSection *section = [[SFMutableResultSection alloc]init];
    
    for (SPBSearchResult *result in self.results) {
        [self setRequiredAttributesOnResult:result];
    }
    
    [section addResultsFromArray:[self results]];
    [section setGroupId:[NSNumber numberWithInt:14]];
    [section setGroupName:[self title]];
    [section setDomain:4];
    [section setBundleIdentifier:@"com.apple.calculator"];
    [section setTitle: @"MENU_EXPRESSION"];
    
    return section;
}


@end
#endif
