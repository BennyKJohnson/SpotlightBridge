//
//  SPBPreviewController.m
//  SpotlightBridgeFramework
//
//  Created by Benjamin Johnson on 19/7/20.
//  Copyright © 2020 Benjamin Johnson. All rights reserved.
//

#import "SPBPreviewController.h"
#import "SPBSearchResult.h"

@interface SPBPreviewController ()

@end

@implementation SPBPreviewController

- (instancetype)init
{
    self = [super initWithNibName:@"SPBPreviewController" bundle: [NSBundle bundleWithIdentifier:@"benjamin.spotlightbridge.SpotlightBridgeFramework"]];
    if (self) {
        
    }
    return self;
}
//
//- (void)preheat:(id)searchResult row:(int)arg2 generation:(int)arg3 {
//    NSLog(@"prehead was called");
//    
//    SPBSearchResult *result = (SPBSearchResult*) searchResult;
//    [self setSearchResult:searchResult];
//    
//  //  [self.titleTextLabel setStringValue:result.displayName];
//    
//    [super preheat:searchResult row:arg2 generation:arg3];
//}

+(SPBPreviewController*) shared {
    return [[SPBPreviewController alloc] init];
}

-(void)setRepresentedObject:(SPBSearchResult*)representedObject {
    [self.titleTextLabel setStringValue:[representedObject displayName]];
}

@end
