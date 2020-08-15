//
//  SPBTestExtensionManager.m
//  SpotlightBridgeTests
//
//  Created by Benjamin Johnson on 15/8/20.
//  Copyright © 2020 Benjamin Johnson. All rights reserved.
//

#import "SPBTestExtensionManager.h"

@implementation SPBTestExtensionManager

-(NSMutableArray *) extensionBundlePaths {
    NSString *testExtensionPath = [[NSBundle bundleForClass:[self class]] pathForResource:@"SPBTestExtension" ofType:@"bundle"];
    return [NSMutableArray arrayWithArray:@[testExtensionPath]];
}

@end
