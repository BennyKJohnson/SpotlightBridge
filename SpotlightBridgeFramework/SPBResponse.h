#import <Foundation/Foundation.h>
#import "SPKResponse.h"

NS_ASSUME_NONNULL_BEGIN

@interface SPBResponse : NSObject

@property (nonatomic) BOOL topHitIsIn;

@property (nonatomic) unsigned long long queryId;

@property (nonatomic, strong) NSArray *sections;

@end

NS_ASSUME_NONNULL_END
