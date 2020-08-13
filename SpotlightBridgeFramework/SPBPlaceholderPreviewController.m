//
//  SPBPlaceholderPreviewController.m
//  SpotlightBridgeFramework
//
//  Created by Benjamin Johnson on 19/7/20.
//  Copyright © 2020 Benjamin Johnson. All rights reserved.
//

#import "SPBPlaceholderPreviewController.h"
#import "SPBSearchResult.h"

@interface SPBPlaceholderPreviewController ()

@end

@implementation SPBPlaceholderPreviewController

- (instancetype)init
{
    self = [super initWithNibName:@"SPBPlaceholderPreviewController" bundle: [NSBundle bundleWithIdentifier:@"benjamin.spotlightbridge.SpotlightBridgeFramework"]];
    if (self) {
        
    }
    return self;
}

+(SPBPlaceholderPreviewController*) shared {
    return [[SPBPlaceholderPreviewController alloc] init];
}

-(void)setRepresentedObject:(SPBSearchResult*)representedObject {
    [self.titleTextLabel setStringValue:[representedObject displayName]];
}



@end
