//
//  SPBExtensionManagerTests.m
//  SpotlightBridgeTests
//
//  Created by Benjamin Johnson on 15/8/20.
//  Copyright © 2020 Benjamin Johnson. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SPBExtensionManager.h"
#import "SPBTestExtensionManager.h"

@interface SPBExtensionManagerTests : XCTestCase

@end

@implementation SPBExtensionManagerTests

-(void)testInitWithApplicationSupportSubPath {
    NSString *applicationSupportSubPath = @"Application Support/SpotlightBridge";
    
    SPBExtensionManager *extensionManager = [[SPBExtensionManager alloc] initWithApplicationSupportSubPath:applicationSupportSubPath];
    
    XCTAssertNotNil(extensionManager);
    XCTAssertTrue([extensionManager.applicationSupportSubPath isEqualToString:applicationSupportSubPath]);
}

-(void)testLoadExtensionWithInvalidPath {
    SPBExtensionManager *extensionManager = [[SPBExtensionManager alloc] initWithApplicationSupportSubPath:@"Application Support/SpotlightBridge"];
    
    Class extensionClass = [extensionManager loadExtensionWithPath:@"/Fakepath/fake.bundle"];
    XCTAssertNil(extensionClass);
}

-(void)testLoadExtensionWithValidPath {
    SPBExtensionManager *extensionManager = [[SPBExtensionManager alloc] initWithApplicationSupportSubPath:@"Application Support/SpotlightBridge"];
    
    NSString *testExtensionPath = [[NSBundle bundleForClass:[self class]] pathForResource:@"SPBTestExtension" ofType:@"bundle"];
    
    Class extensionClass = [extensionManager loadExtensionWithPath:testExtensionPath];
    
    XCTAssertNotNil(extensionClass);
    XCTAssertTrue([[extensionClass className] isEqualToString:@"SPBTestQuery"]);
}

-(void)testLoadExtensions {
    SPBTestExtensionManager *extensionManager = [[SPBTestExtensionManager alloc] initWithApplicationSupportSubPath:@"Application Support/SpotlightBridge"];
    [extensionManager loadExtensions];
    
    XCTAssertEqual([extensionManager.extensions count], 1);
    XCTAssertTrue([[extensionManager.extensions[0] className] isEqualToString:@"SPBTestQuery"]);
}

@end
