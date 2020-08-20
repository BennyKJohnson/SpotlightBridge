
#import "SPBPlaceholderPreviewController.h"
#import "SPBSearchResult.h"

@interface SPBPlaceholderPreviewController ()

@end

@implementation SPBPlaceholderPreviewController

- (instancetype)init
{
    self = [super initWithNibName:@"SPBPlaceholderPreviewController" bundle: [NSBundle bundleWithIdentifier:@"benjamin.spotlightbridge.SpotlightBridgeFramework"]];
    if (self) {
        
    }
    return self;
}

+(SPBPlaceholderPreviewController*) shared {
    return [[SPBPlaceholderPreviewController alloc] init];
}

- (void)displayResult:(SPBSearchResult *)result {
    [self.titleTextLabel setStringValue:[result displayName]];
}

@end
