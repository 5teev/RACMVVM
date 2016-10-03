//
//  ViewModel.m
//  RACMVVM
//
//  Created by Steve Milano on 6/22/16.
//  Copyright © 2016 SEDIFY. All rights reserved.
//

#import "ViewModel.h"

@interface ViewModel ()
@property (nonatomic) NSArray *testArray;
@end

@implementation ViewModel
- (instancetype)initWithArrayToTest:(NSArray <NSString *>*)testArray {
    self = [super init];
    if( self ) {
        _testArray = testArray;
        self.beatle = @"NONE";
        // simulate updates to the beatle value
        [self synthesizeDataOverInterval];
    }
    return self;
}

- (void)synthesizeDataOverInterval {

    // how many seconds between updates?
    float rhythm = 2.0f;
    float delayFactor = 0.0f;
    
    for (NSString *name in self.testArray) {
        delayFactor += 1.0f;
        [self executeBlock:^{
            self.beatle = name;
            // note: no effect here, must use self.beatle
            _beatle = [self.beatle uppercaseString];

            // delayFactor increments by 1 for each item to max length of array
            if ( delayFactor == self.testArray.count ) {
                // final update for this iteration, now re-run method
                [self synthesizeDataOverInterval];
            }
        } afterDelay:delayFactor * rhythm];
    }

}

- (void)executeBlock:(void (^)(void))block afterDelay:(float)seconds {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(seconds * NSEC_PER_SEC)), dispatch_get_main_queue(),block);
}
@end
