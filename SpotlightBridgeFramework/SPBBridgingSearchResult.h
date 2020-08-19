//
//  SPBBridgingSearchResult.h
//  SpotlightBridgeFramework
//
//  Created by Benjamin Johnson on 1/8/20.
//  Copyright © 2020 Benjamin Johnson. All rights reserved.
//

#import <Foundation/Foundation.h>

#include <Availability.h>

#if __MAC_OS_X_VERSION_MAX_ALLOWED >= 101500
#import "Headers/10.15/Spotlight/PRSCalculatorResult.h"
#else
#import "Headers/10.14/PRSCalculatorResult.h"
#endif

#import "SPBSearchResult.h"


NS_ASSUME_NONNULL_BEGIN

@interface SPBBridgingSearchResult : PRSCalculatorResult

@property (nonatomic, strong) SPBSearchResult *searchResult;

@property (nonatomic, strong) NSString *sectionName;

-(instancetype) initWithSearchResult: (SPBSearchResult*)searchResult;

-(NSImage*)iconImage;

@end

NS_ASSUME_NONNULL_END
