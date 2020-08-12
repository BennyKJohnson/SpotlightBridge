//
//  SPBExtensionManager.h
//  SpotlightBridge
//
//  Created by Benjamin Johnson on 25/7/20.
//  Copyright © 2020 Benjamin Johnson. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SPBExtensionManager : NSObject

-(instancetype)initWithApplicationSupportSubPath:(NSString *)subpath;

-(void) loadExtensions;

@property (nonatomic, strong) NSString *applicationSupportSubPath;

@property (nonatomic, strong) NSArray *extensions;

@end

NS_ASSUME_NONNULL_END
