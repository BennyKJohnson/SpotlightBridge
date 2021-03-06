
#import <Foundation/Foundation.h>
#import "SPBSearchResult.h"

extern int const SPBResultSectionDomain;
extern int const SPBResultSectionGroupID;

NS_ASSUME_NONNULL_BEGIN

@interface SPBResultSection : NSObject

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSArray *results;

@property (nonatomic) BOOL pinToTop;

@property (nonatomic, strong) NSString *bundleIdentifier;

-(instancetype) initWithTitle: (NSString *)title;

-(NSArray*)spotlightResults;

@end

NS_ASSUME_NONNULL_END
