//
//  SPBQuery.m
//  SpotlightBridgeFramework
//
//  Created by Benjamin Johnson on 14/7/20.
//  Copyright © 2020 Benjamin Johnson. All rights reserved.
//

#import "SPBQuery.h"
#import "SPBSearchResult.h"
#import "SPBResponse.h"
#import "SPBResultSection.h"

@implementation SPBQuery

-(id) initWithUserQuery:(NSString *)arg2 queryGroupId:(unsigned long long)arg3 options:(unsigned long long)arg4 keyboardLanguage:(id)arg5 {
    NSString *copyOfQuery = [arg2 copy];
    
    self = [super initWithUserQuery:copyOfQuery queryGroupId:arg3 options:arg4 keyboardLanguage:arg5];

    return self;
}

+(BOOL) isQuerySupported:(NSString *)query {
    return YES;
}

@end
