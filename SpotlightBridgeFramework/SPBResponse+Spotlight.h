//
//  SPBResponse+Spotlight.h
//  SpotlightBridgeFramework
//
//  Created by Benjamin Johnson on 20/8/20.
//  Copyright © 2020 Benjamin Johnson. All rights reserved.
//

#import <SpotlightBridge/SpotlightBridge.h>

NS_ASSUME_NONNULL_BEGIN

@interface SPBResponse (Spotlight)

-(NSArray *)spotlightResults;
-(NSArray *)spotlightResultSections;

@end

NS_ASSUME_NONNULL_END
