//
//  SPBTestPreviewController.m
//  SpotlightBridgeFrameworkTests
//
//  Created by Benjamin Johnson on 15/8/20.
//  Copyright © 2020 Benjamin Johnson. All rights reserved.
//

#import "SPBTestPreviewController.h"

@interface SPBTestPreviewController ()

@end

@implementation SPBTestPreviewController

- (void)displayResult:(SPBSearchResult *)result {
    self.lastResult = result;
}

@end
