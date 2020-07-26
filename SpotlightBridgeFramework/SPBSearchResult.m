//
//  SPBSearchResult.m
//  SpotlightBridgeFramework
//
//  Created by Benjamin Johnson on 14/7/20.
//  Copyright © 2020 Benjamin Johnson. All rights reserved.
//

#import "SPBSearchResult.h"
#import "SPBPreviewController.h"

@implementation SPBSearchResult
-(NSString *) category {
    return @"MENU_CONVERSION";
}

//-(NSString *) type {
//    return [self category];
//}

-(BOOL)isCalculation {
    return YES;
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

-(instancetype) initWithDisplayName: (NSString*)displayName {
    self = [super initWithContentType:nil  displayName:displayName];
    return self;
}

-(NSImage*)iconImage {
    return [[NSWorkspace sharedWorkspace] iconForFile:@"/System/Library/CoreServices/Spotlight.app"];
}
//
-(BOOL)openWithSearchString:(NSString*)searchString block:(void *)arg3 {
    return [self openWithSearchString:searchString];
}

-(BOOL)openWithSearchString: (NSString *)searchString {
    return YES;
}

-(id)sharedCustomPreviewController {
    return [SPBPreviewController shared];
}

@end
