//
//  ViewModel.m
//  RACMVVM
//
//  Created by Steve Milano on 6/22/16.
//  Copyright © 2016 SEDIFY. All rights reserved.
//

#import "ViewModel.h"

@implementation ViewModel
- (instancetype)init {
    self = [super init];

    self.beatle = @"NONE";
    // simulate updates to the beatle value
    [self synthesizeDataOverInterval];
    
    return self;
}

- (void)synthesizeDataOverInterval {

    // how many seconds between updates?
    float rhythm = 2.0f;

    [self executeBlock:^{
        self.beatle = @"George";
        // note: no effect here, must use self.beatle
        _beatle = @"GEORGE";
    } afterDelay:1.0f * rhythm];
    
    [self executeBlock:^{
        self.beatle = @"Fred";
        // note: no effect here, must use self.beatle
        _beatle = @"FRED";
    } afterDelay:2.0f * rhythm];
    
    [self executeBlock:^{
        self.beatle = @"Paul";
        // note: no effect here, must use self.beatle
        _beatle = @"PAUL";
    } afterDelay:3.0f * rhythm];
    
    [self executeBlock:^{
        self.beatle = @"Ringo";
        // note: no effect here, must use self.beatle
        _beatle = @"RINGO";
    } afterDelay:4.0f * rhythm];
    
    [self executeBlock:^{
        self.beatle = @"John";
        // note: no effect here, must use self.beatle
        _beatle = @"JOHN";
    } afterDelay:5.0f * rhythm];
    
    [self executeBlock:^{
        self.beatle = @"Allan the Hedgehog";
        // note: no effect here, must use self.beatle
        _beatle = @"ALLAN THE HEDGEHOG";
        
        // after final update, re-run this method
        [self synthesizeDataOverInterval];
    } afterDelay:6.0f * rhythm];
}

- (void)executeBlock:(void (^)(void))block afterDelay:(float)seconds {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(seconds * NSEC_PER_SEC)), dispatch_get_main_queue(),block);
}
@end
