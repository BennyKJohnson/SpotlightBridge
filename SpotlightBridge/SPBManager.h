//
//  SPBManager.h
//  SpotlightBridge
//
//  Created by Benjamin Johnson on 11/7/20.
//  Copyright © 2020 Benjamin Johnson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPBExtensionManager.h"

@interface SPBManager : NSObject

+ (instancetype)sharedInstance;

@property (nonatomic, strong) SPBExtensionManager *extensionManager;

@end
