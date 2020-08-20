//
//  SPBResponse+Spotlight.m
//  SpotlightBridgeFramework
//
//  Created by Benjamin Johnson on 20/8/20.
//  Copyright © 2020 Benjamin Johnson. All rights reserved.
//

#import "SPBResponse+Spotlight.h"
#import "SPBResultSection+SFMutableResultSection.h"
#import "SFMutableResultSection.h"

@implementation SPBResponse (Spotlight)

-(NSArray *)spotlightResultSections {
    NSMutableArray *spotlightResultSections = [NSMutableArray array];
    for (SPBResultSection *section in self.sections) {
        SFMutableResultSection *sfResultSection = [section createSpotlightResultSection];
        [spotlightResultSections addObject:sfResultSection];
    }
    
    return [spotlightResultSections copy];
}

-(NSArray *)spotlightResults {
    NSMutableArray *results = [NSMutableArray array];
    for (SPBResultSection *section in self.sections) {
        [results addObjectsFromArray:[section spotlightResults]];
    }
    
    return [results copy];
}


@end
