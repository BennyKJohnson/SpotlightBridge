//
//  SPBResponse.h
//  SpotlightBridgeFramework
//
//  Created by Benjamin Johnson on 25/7/20.
//  Copyright © 2020 Benjamin Johnson. All rights reserved.
//

#import <Foundation/Foundation.h>

#if MAC_OS_X_VERSION_10_14 == MAC_OS_X_VERSION_MAX_ALLOWED
#import "Headers/10.14/Spotlight/SPKResponse.h"
#elif MAC_OS_X_VERSION_10_15 <= MAC_OS_X_VERSION_MAX_ALLOWED
#import "SPKResponse.h"
#endif


NS_ASSUME_NONNULL_BEGIN

@interface SPBResponse : NSObject

@property (nonatomic) BOOL topHitIsIn;

@property (nonatomic) unsigned long long queryId;

@property (nonatomic, strong) NSArray *sections;

-(SPKResponse*) spotlightResponse;

@end

NS_ASSUME_NONNULL_END
