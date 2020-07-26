//
//  SPBSearchResult.h
//  SpotlightBridgeFramework
//
//  Created by Benjamin Johnson on 14/7/20.
//  Copyright © 2020 Benjamin Johnson. All rights reserved.
//

//#import "SpotlightHeaders/PRSResult.h"
#import <Foundation/Foundation.h>
#import "PRSCalculatorResult.h"


NS_ASSUME_NONNULL_BEGIN

@interface SPBSearchResult: PRSCalculatorResult

-(instancetype) initWithDisplayName: (NSString*)displayName;

-(BOOL)openWithSearchString: (NSString *)searchString;

-(NSString *) category;

-(NSString *) groupName;

-(NSImage*)iconImage;

@end

NS_ASSUME_NONNULL_END
