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

-(instancetype) initWithDisplayName: (NSString*)displayName {
    self = [super init];
    if (self) {
        self.displayName = displayName;
    }
    
    return self;
}

-(BOOL)openWithSearchString: (NSString *)searchString {
    return YES;
}

-(NSImage *)iconImage {
    return [[NSWorkspace sharedWorkspace] iconForFile:@"/System/Library/CoreServices/Spotlight.app"];
}

-(NSViewController*) previewViewController {
    return [SPBPreviewController shared];
}

@end
