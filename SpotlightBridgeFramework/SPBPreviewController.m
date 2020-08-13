//
//  SPBPreviewController.m
//  SpotlightBridgeFramework
//
//  Created by Benjamin Johnson on 19/7/20.
//  Copyright © 2020 Benjamin Johnson. All rights reserved.
//

#import "SPBPreviewController.h"
#import "SPBBridgingSearchResult.h"

@interface SPBPreviewController ()

@end

@implementation SPBPreviewController

-(void)setRepresentedObject:(SPBBridgingSearchResult*)representedObject {
    [self displayResult:representedObject.searchResult];
}

- (void)displayResult:(SPBSearchResult *)result {}

@end
