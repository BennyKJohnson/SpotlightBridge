
#import "SPBQuery.h"
#import "SPBSearchResult.h"
#import "SPBResponse.h"
#import "SPBResultSection.h"
#import "SPKResponse+SPBResponse.h"

@implementation SPBQuery

-(id) initWithUserQuery:(NSString *)arg2 queryGroupId:(unsigned long long)arg3 options:(unsigned long long)arg4 keyboardLanguage:(id)arg5 {
    NSString *copyOfQuery = [arg2 copy];
    
    self = [super initWithUserQuery:copyOfQuery queryGroupId:arg3 options:arg4 keyboardLanguage:arg5];

    return self;
}

+(BOOL) isQuerySupported:(NSString *)query {
    return YES;
}

-(void) start {
    [super start];
    
    [self performQuery:self.userQueryString withCompletionHandler:^(SPBResponse * response) {
        [self handleQueryResponse:response];
    }];
}

-(void) handleQueryResponse: (SPBResponse*)response {
    if (response) {
        SPKResponse *convertedResponse = [[SPKResponse alloc] initWithBridgedResponse:response];
        self.responseHandler(convertedResponse);
    } else {
        self.responseHandler(NULL);
    }
}

-(void) performQuery:(NSString *)userQueryString withCompletionHandler:(void (^)(SPBResponse *response))completionHandler {
    NSLog(@"SpotlightBridge performQuery should be overridden in subclass");
    completionHandler(NULL);
}

@end
