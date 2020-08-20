
#import <Cocoa/Cocoa.h>
#include <Availability.h>

#ifdef __MAC_10_15
#import "SPPreviewController.h"

#endif
#ifdef __MAC_10_14
#import "PRSPreviewController.h"
#define SPPreviewController PRSPreviewController
#endif

#import "SPBSearchResult.h"

NS_ASSUME_NONNULL_BEGIN

@interface SPBPreviewController : SPPreviewController

-(void)displayResult: (SPBSearchResult *)result;

@end

NS_ASSUME_NONNULL_END
