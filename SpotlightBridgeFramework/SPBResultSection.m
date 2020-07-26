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

-(SFMutableResultSection*)createSpotlightResultSection {
    
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
