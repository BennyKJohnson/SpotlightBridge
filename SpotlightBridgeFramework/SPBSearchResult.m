//
//  SPBSearchResult.m
//  SpotlightBridgeFramework
//
//  Created by Benjamin Johnson on 14/7/20.
//  Copyright © 2020 Benjamin Johnson. All rights reserved.
//

#import "SPBSearchResult.h"
#import "SPBPlaceholderPreviewController.h"

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

-(NSImage*)iconImageForApplication {
    return [self iconImage];
}

-(NSViewController*) previewViewController {
    return [SPBPlaceholderPreviewController shared];
}

-(BOOL)isTopHit {
    return NO;
}

-(float) maxScore {
    return 100;
}

-(float) score {
    return 50;
}

@end
