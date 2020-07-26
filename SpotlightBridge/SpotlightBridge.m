//
//  SpotlightBridge.m
//  SpotlightBridge
//
//  Created by Benjamin Johnson on 26/7/20.
//Copyright © 2020 Benjamin Johnson. All rights reserved.
//

#import "SpotlightBridge.h"

@interface SpotlightBridge()

@end


@implementation SpotlightBridge

/**
 * @return the single static instance of the plugin object
 */
+ (instancetype)sharedInstance
{
    static SpotlightBridge *plugin = nil;
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
    SpotlightBridge *plugin = [SpotlightBridge sharedInstance];
    NSUInteger osx_ver = [[NSProcessInfo processInfo] operatingSystemVersion].minorVersion;
    NSLog(@"%@ loaded into %@ on macOS 10.%ld", [self class], [[NSBundle mainBundle] bundleIdentifier], (long)osx_ver);
}


@end
