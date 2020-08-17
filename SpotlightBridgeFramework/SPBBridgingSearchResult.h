//
//  SPBBridgingSearchResult.h
//  SpotlightBridgeFramework
//
//  Created by Benjamin Johnson on 1/8/20.
//  Copyright © 2020 Benjamin Johnson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PRSCalculatorResult.h"
#import "SPBSearchResult.h"


NS_ASSUME_NONNULL_BEGIN

@interface SPBBridgingSearchResult : PRSCalculatorResult

@property (nonatomic, strong) SPBSearchResult *searchResult;

@property (nonatomic, strong) NSString *sectionName;

-(instancetype) initWithSearchResult: (SPBSearchResult*)searchResult;

-(NSImage*)iconImage;

@end

NS_ASSUME_NONNULL_END
