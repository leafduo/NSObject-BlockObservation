//
//  main.m
//  NSObject+BlockObservation
//
//  Created by leafduo on 2/21/13.
//  Copyright (c) 2013 leafduo.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+BlockObservation.h"
#import "Observer.h"
#import "Observee.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {

        Observee *observee = [[Observee alloc] init];
        observee.number = 1;
        @autoreleasepool {
            Observer *observer = [[Observer alloc] init];
            /* If don't use weak reference of observer, retain cycle do occurs,
               but the complier (as of Xcode 4.6) failed to identify it, use our brains to prevent that.
             */
            __weak __typeof(&*observer)weakObserver = observer;
            [observer observe:observee forKeyPath:@"number" onQueue:nil task:^(id obj, NSDictionary *change) {
                weakObserver.number = observee.number + 100;
                NSLog(@"%ld", (long)weakObserver.number);
            }];
            observee.number = 2;
        }
        observee.number = 3;
    }
    return 0;
}