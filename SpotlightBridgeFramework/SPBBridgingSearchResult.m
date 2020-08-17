//
//  SPBBridgingSearchResult.m
//  SpotlightBridgeFramework
//
//  Created by Benjamin Johnson on 1/8/20.
//  Copyright © 2020 Benjamin Johnson. All rights reserved.
//

#import "SPBBridgingSearchResult.h"
#include <Availability.h>

@implementation SPBBridgingSearchResult

-(instancetype) initWithSearchResult: (SPBSearchResult*)searchResult {
    self = [super initWithContentType:nil displayName:searchResult.displayName];
    if (self) {
        self.searchResult = searchResult;
        
        if ([self respondsToSelector:@selector(setIdentifier:)]) {
            NSString *identifier = [[[NSUUID alloc] init] UUIDString];
            self.identifier = identifier;
        }

        if ([self respondsToSelector:@selector(setSectionBundleIdentifier:)]) {
            NSString *calculatorBundleIdentifier = @"com.apple.calculator";
            self.sectionBundleIdentifier = calculatorBundleIdentifier;
        }

        #ifdef __MAC_10_15
            self.isLocalApplicationResult = true;
            if ([searchResult isTopHit]) {
                const int SpotlightTopHitValue = 2;
                self.topHit = SpotlightTopHitValue;
            }
        #endif
    }
    
    return self;
}

-(unsigned long long)rank {
    return 0xffffffffffffffff;
}

-(NSString*)groupName {
    return self.sectionName;
}

-(NSString *)category {
    return self.sectionName;
}

-(id)sharedCustomPreviewController {
    return [self.searchResult previewViewController];
}

-(NSImage*)iconImage {
    return [self.searchResult iconImage];
}

-(NSImage*)iconImageForApplication {
    return [self.searchResult iconImageForApplication];
}

-(BOOL)openWithSearchString:(NSString*)searchString block:(void *)arg3 {
    return [self.searchResult openWithSearchString:searchString];
}

- (BOOL)isLocalResult {
    return YES;
}

@end
