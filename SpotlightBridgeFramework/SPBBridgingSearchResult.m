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
         self.type = 2;
         
        NSString *identifier = [[[NSUUID alloc] init] UUIDString];
        self.identifier = identifier;
        
        NSString *calculatorBundleIdentifier = @"com.apple.calculator";
        self.sectionBundleIdentifier = calculatorBundleIdentifier;
    }
    
    return self;
}

-(unsigned long long)rank {
    return 0xffffffffffffffff;
}

-(unsigned long long)score {
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
    return [self iconImage];
}

-(BOOL)openWithSearchString:(NSString*)searchString block:(void *)arg3 {
    return [self.searchResult openWithSearchString:searchString];
}

@end
