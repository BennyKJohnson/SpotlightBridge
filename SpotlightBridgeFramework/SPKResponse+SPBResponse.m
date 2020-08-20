#import "SPKResponse+SPBResponse.h"
#import "SPBResponse+Spotlight.h"

#include <Availability.h>

int SPKResponseKind = 2;

@implementation SPKResponse (SPBResponse)

-(instancetype)initWithBridgedResponse: (SPBResponse*)response {
    #ifdef __MAC_10_15
    self = [[SPKResponse alloc] initWithQueryID:[self queryId] kind: SPKResponseKind sections:[response spotlightResultSections]];
    #else
    self = [[SPKResponse alloc]initWithQueryID:[self queryId] kind: SPKResponseKind results:[response spotlightResults]];
    #endif
    
    if (self) {
        [self setTopHitIsIn:YES];
    }
    
    return self;
}

@end
