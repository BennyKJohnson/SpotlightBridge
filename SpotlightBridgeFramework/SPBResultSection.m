//
//  SPBResultSection.m
//  SpotlightBridgeFramework
//
//  Created by Benjamin Johnson on 25/7/20.
//  Copyright © 2020 Benjamin Johnson. All rights reserved.
//

#import "SPBResultSection.h"
#import "SPBSearchResult.h"

@implementation SPBResultSection

-(instancetype) initWithTitle: (NSString *)title {
    self = [super init];
    if (self) {
        [self setTitle:title];
    }
    
    return self;
}

@end
