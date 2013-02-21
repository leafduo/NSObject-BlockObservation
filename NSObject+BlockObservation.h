//
//  NSObject+BlockObservation.h
//  Version 1.0
//
//  Andy Matuschak
//  andy@andymatuschak.org
//  Public domain because I love you. Let me know how you use it.
//

#import <Foundation/Foundation.h>

typedef NSString AMBlockToken;
typedef void (^AMBlockTask)(id obj, NSDictionary *change);

@interface NSObject (AMBlockObservation)
- (AMBlockToken *)observe:(id)observee forKeyPath:(NSString *)keyPath task:(AMBlockTask)task;
- (AMBlockToken *)observe:(id)observee forKeyPath:(NSString *)keyPath onQueue:(NSOperationQueue *)queue task:(AMBlockTask)task;
- (void)removeObserverWithBlockToken:(AMBlockToken *)token;
@end
