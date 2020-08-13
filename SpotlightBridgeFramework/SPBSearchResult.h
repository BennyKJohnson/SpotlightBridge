//
//  SPBSearchResult.h
//  SpotlightBridgeFramework
//
//  Created by Benjamin Johnson on 14/7/20.
//  Copyright © 2020 Benjamin Johnson. All rights reserved.
//

#import <AppKit/AppKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SPBSearchResult: NSObject

-(instancetype) initWithDisplayName: (NSString*)displayName;

-(BOOL)openWithSearchString: (NSString *)searchString;

-(NSImage*)iconImage;

@property (nonatomic, strong) NSString* displayName;

-(BOOL)isTopHit;

-(NSViewController*) previewViewController;

-(float) maxScore;

-(float) score;

@end

NS_ASSUME_NONNULL_END
