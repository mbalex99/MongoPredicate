//
//  MongoPredicateTests.m
//  MongoPredicateTests
//
//  Created by Max Alexander on 1/25/17.
//  Copyright © 2017 Max Alexander. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSPredicate+Mongo.h"

@interface MongoPredicateTests : XCTestCase

@end

@implementation MongoPredicateTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"firstname beginswith[c] %@", @"max"];
    NSDictionary *dict = [predicate queryDictOrError:nil];
    NSLog(@"%@", dict);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
