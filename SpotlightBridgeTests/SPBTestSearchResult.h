//
//  SPBTestSearchResult.h
//  SpotlightBridgeTests
//
//  Created by Benjamin Johnson on 17/8/20.
//  Copyright © 2020 Benjamin Johnson. All rights reserved.
//

#import <SpotlightBridge/SpotlightBridge.h>

NS_ASSUME_NONNULL_BEGIN

@interface SPBTestSearchResult : SPBSearchResult

@property (nonatomic) float score;

@property (nonatomic) BOOL topHit;


@end

NS_ASSUME_NONNULL_END
