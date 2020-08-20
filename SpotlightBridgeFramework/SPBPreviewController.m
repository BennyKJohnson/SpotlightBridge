
#import "SPBPreviewController.h"
#import "SPBBridgingSearchResult.h"

@interface SPBPreviewController ()

@end

@implementation SPBPreviewController

-(void)setRepresentedObject:(SPBBridgingSearchResult*)representedObject {
    [self displayResult:representedObject.searchResult];
}

- (void)displayResult:(SPBSearchResult *)result {}

@end
