//
//  SPBExtensionManager.m
//  SpotlightBridge
//
//  Created by Benjamin Johnson on 25/7/20.
//  Copyright © 2020 Benjamin Johnson. All rights reserved.
//

#import "SPBExtensionManager.h"
#import "SPBQuery.h"
#import <SpotlightBridge/SpotlightBridge.h>

@implementation SPBExtensionManager

-(instancetype)initWithApplicationSupportSubPath:(NSString *)subpath {
    self = [super init];
    if (self) {
        self.applicationSupportSubPath = subpath;
    }
    
    return self;
}

-(void) loadExtensions {
    NSMutableArray *extensionBundlePaths = [self extensionBundlePaths];
    NSMutableArray *extensions = [NSMutableArray array];
    
    for (NSString *extensionBundlePath in extensionBundlePaths) {
        id extension = [self loadExtensionWithPath:extensionBundlePath];
        if (extension) {
            [extensions addObject:extension];
        }
    }
    
    self.extensions = [extensions copy];
}

- (Class) loadExtensionWithPath: (NSString *)path {
    NSBundle *extensionBundle = [NSBundle bundleWithPath:path];
    if (!extensionBundle || ![extensionBundle load]) {
        NSLog(@"SpotlightBridge failed to load extension at path %@", path);
        return NULL;
    }
    
    Class extensionPrincipalClass = [extensionBundle principalClass];
    if (extensionPrincipalClass && [self validateExtension:extensionPrincipalClass]) {
        return extensionPrincipalClass;
    } else {
        NSLog(@"SpotlightBridge failed to load extension %@", [extensionBundle bundleIdentifier]);
        return NULL;
    }
}

-(NSMutableArray *) extensionBundlePaths {
    NSArray *bundleSearchPaths = [self bundleSearchPaths];
    NSEnumerator *searchPathEnumerator = [bundleSearchPaths objectEnumerator];
    NSMutableArray *bundlePaths = [NSMutableArray array];
    
    NSString *currentPath;
    while (currentPath = [searchPathEnumerator nextObject]) {
        [bundlePaths addObjectsFromArray:[self bundlePathsForSearchPath:currentPath]];
    }
    
    return bundlePaths;
}

-(NSArray *)bundleSearchPaths {
    NSString *appSupportSubpath = @"Application Support/SpotlightBridge";
    NSMutableArray *bundleSearchPaths = [NSMutableArray array];
     
    // Find Library directories in all domains except /System
    NSArray *librarySearchPaths = NSSearchPathForDirectoriesInDomains(
        NSLibraryDirectory, NSAllDomainsMask - NSSystemDomainMask, YES);
    
    for (NSString *currentPath in librarySearchPaths) {
        [bundleSearchPaths addObject:
            [currentPath stringByAppendingPathComponent:appSupportSubpath]];
    }

    return [bundleSearchPaths copy];
}

-(NSMutableArray *)bundlePathsForSearchPath:(NSString*)searchPath {
    NSMutableArray *bundlePaths = [NSMutableArray array];
    NSDirectoryEnumerator *bundleEnumerator = [[NSFileManager defaultManager] enumeratorAtPath:searchPath];
    
    if (!bundleEnumerator) {
        return bundlePaths;
    }
    
    NSString *currentBundlePath;
    while (currentBundlePath = [bundleEnumerator nextObject]) {
        if ([[currentBundlePath pathExtension] isEqualToString:@"bundle"]) {
            [bundlePaths addObject:[searchPath stringByAppendingPathComponent:currentBundlePath]];
        }
    }
    
    return bundlePaths;
}

-(BOOL) validateExtension: (Class) extensionPrincipalClass {
    return [extensionPrincipalClass isSubclassOfClass:[SPBQuery class]];
}

@end
