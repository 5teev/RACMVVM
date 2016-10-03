//
//  ViewModel.h
//  RACMVVM
//
//  Created by Steve Milano on 6/22/16.
//  Copyright © 2016 SEDIFY. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Fake view model that pretends to obtain a string value for beatle every five seconds for 25 seconds.
 */
@interface ViewModel : NSObject

- (instancetype)initWithArrayToTest:(NSArray <NSString *>*)testArray NS_DESIGNATED_INITIALIZER;

// disallow default initializer
- (instancetype)init NS_UNAVAILABLE;

@property (nonatomic, copy) NSString *beatle;

@end
