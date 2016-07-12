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

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0f * rhythm * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.beatle = @"George";
        // note: no effect here, must use self.beatle
        _beatle = @"GEORGE";
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * rhythm * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.beatle = @"Fred";
        // note: no effect here, must use self.beatle
        _beatle = @"FRED";
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0f * rhythm * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.beatle = @"Paul";
        // note: no effect here, must use self.beatle
        _beatle = @"PAUL";
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4.0f * rhythm * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.beatle = @"Ringo";
        // note: no effect here, must use self.beatle
        _beatle = @"RINGO";
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0f * rhythm * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.beatle = @"John";
        // note: no effect here, must use self.beatle
        _beatle = @"JOHN";
    });

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6.0f * rhythm * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.beatle = @"Allan the Hedgehog";
        // note: no effect here, must use self.beatle
        _beatle = @"ALLAN THE HEDGEHOG";

        // after final update, re-run this method
        [self synthesizeDataOverInterval];
    });
}
@end
