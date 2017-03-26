## Turn your NSPredicates into MongoDB Queries
Originally written by @tjboneman. Thank him!

## Getting Started
Easily import this manually with Cocoapods. 

`pod 'MongoPredicate`

This library is written in Objective-C but works well with swift

## Usage 

### Objective-C

```objective-c
NSPredicate *predicate = [NSPredicate predicateWithFormat:@"firstname CONTAINS[cd] %@", @"max"];;
NSError *error = nil;
NSDictionary *dict = [predicate queryDictOrError:&error];
```
