//
//  SPBResultSection.h
//  SpotlightBridgeFramework
//
//  Created by Benjamin Johnson on 25/7/20.
//  Copyright © 2020 Benjamin Johnson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPBSearchResult.h"

NS_ASSUME_NONNULL_BEGIN

@interface SPBResultSection : NSObject

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSArray *results;

-(instancetype) initWithTitle: (NSString *)title;


@end

NS_ASSUME_NONNULL_END
