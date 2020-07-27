//
//  SPBResponse.h
//  SpotlightBridgeFramework
//
//  Created by Benjamin Johnson on 25/7/20.
//  Copyright © 2020 Benjamin Johnson. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SPKResponse.h"


NS_ASSUME_NONNULL_BEGIN

@interface SPBResponse : NSObject

@property (nonatomic) BOOL topHitIsIn;

@property (nonatomic) unsigned long long queryId;

@property (nonatomic, strong) NSArray *sections;

-(SPKResponse*) spotlightResponse;

@end

NS_ASSUME_NONNULL_END
