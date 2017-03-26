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

- (void)testSimpleEquality {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"firstname == %@", @"max"];
    NSError *error = nil;
    NSDictionary *dict = [predicate queryDictOrError:&error];
    XCTAssertNil(error);
    XCTAssertEqualObjects(dict, @{ @"firstname": @"max"});
}

- (void)testContainsSubstring {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"firstname CONTAINS[cd] %@", @"max"];
    NSError *error = nil;
    NSDictionary *dict = [predicate queryDictOrError:&error];
    XCTAssertNil(error);
    XCTAssertEqualObjects(dict, @{
                                  @"firstname": @{
                                          @"$regex": @".*max.*"
                                          }
                                  });
}

- (void)testGreaterOrEqualsTo {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"age >= %d", 25];
    NSError *error = nil;
    NSDictionary *dict = [predicate queryDictOrError:&error];
    XCTAssertNil(error);
    XCTAssertEqualObjects(dict, @{
                                  @"age": @{
                                          @"$gte": @(25)
                                          }
                                  });
}

- (void)testLessThanOrEqualsTo {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"age <= %d", 25];
    NSError *error = nil;
    NSDictionary *dict = [predicate queryDictOrError:&error];
    XCTAssertNil(error);
    XCTAssertEqualObjects(dict, @{
                                  @"age": @{
                                          @"$lte": @(25)
                                          }
                                  });
}

- (void )testBetweenRange {
    NSPredicate *predicate = [NSPredicate predicateWithFormat: @"expenses BETWEEN {200, 400}"];
    NSError *error = nil;
    NSDictionary *dict = [predicate queryDictOrError:&error];
    XCTAssertNil(error);
    
    NSDictionary *expectedDictionary = @{
                                         @"$and": @[
                                                 @{@"expenses": @{ @"$gte": @(200) }},
                                                 @{@"expenses": @{ @"$lte": @(400) }}
                                                 ]
                                         };
    
    XCTAssertEqualObjects(dict, expectedDictionary);
}
@end
