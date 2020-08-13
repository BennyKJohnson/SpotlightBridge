//
//  SPBQuery.h
//  SpotlightBridgeFramework
//
//  Created by Benjamin Johnson on 14/7/20.
//  Copyright © 2020 Benjamin Johnson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPKQuery.h"
#import "SPBResponse.h"

@interface SPBQuery : SPKQuery
+(BOOL) isQuerySupported:(NSString *)query;
-(id) initWithUserQuery:(NSString *)arg2 queryGroupId:(unsigned long long)arg3 options:(unsigned long long)arg4 keyboardLanguage:(id)arg5;
-(void) performQuery:(NSString *)userQueryString withCompletionHandler:(void (^)(SPBResponse *response))completionHandler;

@end

