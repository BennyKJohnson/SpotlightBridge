//
//  SPBPreviewController.m
//  SpotlightBridgeFrameworkTests
//
//  Created by Benjamin Johnson on 15/8/20.
//  Copyright © 2020 Benjamin Johnson. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SPBTestPreviewController.h"
#import "SPBBridgingSearchResult.h"

@interface SPBPreviewControllerTests : XCTestCase

@end

@implementation SPBPreviewControllerTests

-(void)testDisplayResultIsCalledWithSearchResultWhenSettingRepresentedObject {
    SPBTestPreviewController *controller = [[SPBTestPreviewController alloc]init];
    SPBSearchResult *searchResult = [[SPBSearchResult alloc] init];
    SPBBridgingSearchResult *bridgingSearchResult = [[SPBBridgingSearchResult alloc] initWithSearchResult: searchResult];
    
    XCTAssertNil(controller.lastResult);
    controller.representedObject = bridgingSearchResult;
    XCTAssertEqual(controller.lastResult, bridgingSearchResult.searchResult);
    
}

@end
