//
//  SPBResponse.m
//  SpotlightBridgeFramework
//
//  Created by Benjamin Johnson on 25/7/20.
//  Copyright © 2020 Benjamin Johnson. All rights reserved.
//

@class SFMutableResultSection;

#import "SPBResponse.h"
#import "SPBResultSection.h"
#import "SPBResultSection+SFMutableResultSection.h"
#import "SFMutableResultSection.h"
#import "SPBBridgingSearchResult.h"
#include <Availability.h>

@implementation SPBResponse

-(SPKResponse*) spotlightResponse {
    SPKResponse *response;
    
#ifdef __MAC_10_15
    response = [self spotlightResponseForCatalina];
#else
    response = [self spotlightResponseForMojave];
#endif
    
    if (!response) {
        return NULL;
    }
    
    [response setTopHitIsIn:YES];

    return response;
}

-(SPKResponse *) spotlightResponseForCatalina {
    NSMutableArray *spotlightResultSections = [NSMutableArray array];
    for (SPBResultSection *section in self.sections) {
        SFMutableResultSection *sfResultSection = [section createSpotlightResultSection];
        [spotlightResultSections addObject:sfResultSection];
    }
     
    SPKResponse *response = [[SPKResponse alloc] initWithQueryID:[self queryId] kind: 2 sections:[spotlightResultSections copy]];
    
    return response;
}

-(SPKResponse *) spotlightResponseForMojave {
    SPKResponse *response;
    SPBResultSection *section = [self sections][0];
    NSArray *results = [section spotlightResults];
    response = [[SPKResponse alloc]initWithQueryID:[self queryId] kind:2 results:results];
    
    return response;
}

@end
