#import <SpotlightBridge/SpotlightBridge.h>

NS_ASSUME_NONNULL_BEGIN

@interface SPKResponse (SPBResponse)

-(instancetype)initWithBridgedResponse: (SPBResponse*)response;

@end

NS_ASSUME_NONNULL_END
