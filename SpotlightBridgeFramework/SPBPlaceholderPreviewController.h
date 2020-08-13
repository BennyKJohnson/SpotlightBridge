//
//  SPBPreviewController.h
//  SpotlightBridgeFramework
//
//  Created by Benjamin Johnson on 19/7/20.
//  Copyright © 2020 Benjamin Johnson. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#include <Availability.h>

#import "SPBPreviewController.h"

#import "SPBSearchResult.h"

NS_ASSUME_NONNULL_BEGIN

@interface SPBPlaceholderPreviewController : SPBPreviewController

@property (weak) IBOutlet NSTextField *titleTextLabel;

+(SPBPreviewController*) shared;

@property (strong, nonatomic) SPBSearchResult *searchResult;

@end

NS_ASSUME_NONNULL_END
