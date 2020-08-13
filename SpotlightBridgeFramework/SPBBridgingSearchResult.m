//
//  SPBBridgingSearchResult.m
//  SpotlightBridgeFramework
//
//  Created by Benjamin Johnson on 1/8/20.
//  Copyright © 2020 Benjamin Johnson. All rights reserved.
//

#import "SPBBridgingSearchResult.h"

@implementation SPBBridgingSearchResult

-(instancetype) initWithSearchResult: (SPBSearchResult*)searchResult {
    self = [super initWithContentType:nil displayName:searchResult.displayName];
    if (self) {
        self.searchResult = searchResult;
         
        NSString *identifier = [[[NSUUID alloc] init] UUIDString];
        self.identifier = identifier;
        
        NSString *calculatorBundleIdentifier = @"com.apple.calculator";
        self.sectionBundleIdentifier = calculatorBundleIdentifier;
        
        self.isLocalApplicationResult = true;
        if ([searchResult isTopHit]) {
            const int SpotlightTopHitValue = 2;
            self.topHit = SpotlightTopHitValue;
        }
    }
    
    return self;
}

-(unsigned long long)rank {
    return 0xffffffffffffffff;
}

-(NSString*)groupName {
    return @"MENU_EXPRESSION";
}

-(NSString *) category {
    return @"MENU_EXPRESSION";
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
