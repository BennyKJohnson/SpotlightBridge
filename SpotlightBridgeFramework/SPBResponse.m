//
//  SPBResponse.m
//  SpotlightBridgeFramework
//
//  Created by Benjamin Johnson on 25/7/20.
//  Copyright © 2020 Benjamin Johnson. All rights reserved.
//

#import "Headers/10.15/SearchFoundation/SFMutableResultSection.h"

#import "SPBResponse.h"
#import "SPBResultSection.h"

@implementation SPBResponse

-(SPKResponse*) spotlightResponse {
    SPKResponse *response;
    
    if (@available(macOS 10.15,*)) {
        response = [self spotlightResponseForCatalina];
    } else if (@available(macOS 10.14, *)) {
        response = [self spotlightResponseForMojave];
    }
    
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
    
    #if MAC_OS_X_VERSION_10_14 == MAC_OS_X_VERSION_MAX_ALLOWED
    NSArray *results = [[self sections][0] results];
    response = [[SPKResponse alloc]initWithQueryID:[self queryId] kind:2 results:results];
    #endif
    
    return response;
}

@end
