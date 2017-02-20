//
//  MongoPredicate.h
//  MongoPredicate
//
//  Created by Max Alexander on 1/25/17.
//  Copyright © 2017 Max Alexander. All rights reserved.
//

#import <Foundation/Foundation.h>

//! Project version number for MongoPredicate.
FOUNDATION_EXPORT double MongoPredicateVersionNumber;

//! Project version string for MongoPredicate.
FOUNDATION_EXPORT const unsigned char MongoPredicateVersionString[];
#import <Foundation/Foundation.h>
// In this header, you should import all the public headers of your framework using statements like #import <MongoPredicate/PublicHeader.h>


@interface NSPredicate(Mongo)

-(NSDictionary *)queryDictOrError:(NSError **)error;


@end
