//
//  SPBResultSection.m
//  SpotlightBridgeFramework
//
//  Created by Benjamin Johnson on 25/7/20.
//  Copyright © 2020 Benjamin Johnson. All rights reserved.
//

#import "SPBResultSection.h"
#import "SPBSearchResult.h"
#import "SFMutableResultSection.h"

@implementation SPBResultSection

-(instancetype) initWithTitle: (NSString *)title {
    self = [super init];
    if (self) {
        [self setTitle:title];
    }
    
    return self;
}

-(void)setRequiredAttributesOnResult:(SPBSearchResult *)result {
    result.type = 2;
    
    if (!result.identifier) {
       NSString *identifier = [[[NSUUID alloc] init] UUIDString];
       result.identifier = identifier;
   }
   
   if (!result.sectionBundleIdentifier) {
       NSString *calculatorBundleIdentifier = @"com.apple.calculator";
       result.sectionBundleIdentifier = calculatorBundleIdentifier;
   }
}

@end
