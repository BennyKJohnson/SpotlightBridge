//
//  SPBManager.m
//  SpotlightBridge
//
//  Created by Benjamin Johnson on 11/7/20.
//  Copyright © 2020 Benjamin Johnson. All rights reserved.
//
@import AppKit;

#import "SPBManager.h"
#import "SPBSearchResult.h"
#import "SPBExtensionManager.h"
#import "SPBValidator.h"

@interface SPBManager()

@end

@implementation SPBManager

- (instancetype)init
{
    self = [super init];
    if (self) {
     //   self.localizedGroupNameByGroupName = [NSMutableDictionary dictionary];
    }
    return self;
}

/**
 * @return the single static instance of the plugin object
 */
+ (instancetype)sharedInstance
{
    static SPBManager *plugin = nil;
    @synchronized(self) {
        if (!plugin) {
            plugin = [[self alloc] init];
        }
    }
    return plugin;
}

/**
 * A special method called by SIMBL once the application has started and all classes are initialized.
 */
+ (void)load
{
    SPBManager *spotlightBridge = [SPBManager sharedInstance];
    
    NSUInteger osx_ver = [[NSProcessInfo processInfo] operatingSystemVersion].minorVersion;
    NSLog(@"SpotlightBridge loaded into %@ on macOS 10.%ld", [[NSBundle mainBundle] bundleIdentifier], (long)osx_ver);
    
    BOOL realityCheckResult = [SPBValidator performRealityCheck];
    if (!realityCheckResult) {
        NSLog(@"SpotlightBridge failed validation");
    }

    spotlightBridge.extensionManager = [[SPBExtensionManager alloc] initWithApplicationSupportSubPath:@"Application Support/SpotlightBridge"];
    [spotlightBridge.extensionManager loadExtensions];
}

@end
