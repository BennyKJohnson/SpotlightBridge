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
    SFMutableResultSection *section = [[self.sections objectAtIndex:0] createSpotlightResultSection];
    SPKResponse *response = [[SPKResponse alloc] initWithQueryID:[self queryId] kind: 2 sections:[NSArray arrayWithObject:section]];
    
    return response;
}

-(SPKResponse *) spotlightResponseForMojave {
    SPKResponse *response;
    
    NSArray *results = [[self sections][0] results];
    response = [[SPKResponse alloc]initWithQueryID:[self queryId] kind:2 results:results];
    
    return response;
}

@end
