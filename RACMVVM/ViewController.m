//
//  ViewController.m
//  RACMVVM
//
//  Created by Steve Milano on 6/22/16.
//  Copyright © 2016 SEDIFY. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "ViewModel.h"

@interface ViewController ()

@property (nonatomic) ViewModel *viewModel;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.viewModel = [[ViewModel alloc] init];

    [self setUpRAC];
}

/**
 *  Define how to process RAC signals
 */
- (void) setUpRAC {
    RACSignal *beatleSignal = RACObserve(self.viewModel, beatle);

    // use RAC to define label attributes
    RAC(self.label, text) = [beatleSignal
                             map: ^(NSString *value) {
                                 return [self isBeatleNameValid:value] ? [NSString stringWithFormat:@"Beatle Name: %@",value] : [NSString stringWithFormat:@"Invalid Beatle Name: %@",value];
                             }];
    
    RAC(self.label, alpha) = [beatleSignal
                              map: ^(NSString *value) {
                                  return [self isBeatleNameValid:value]  ? @1 : @0.5;
                              }];
    
    RAC(self.label, textColor) = [beatleSignal
                              map: ^(NSString *value) {
                                  return [self isBeatleNameValid:value]  ? [UIColor colorWithRed:0.000 green:0.514 blue:0.000 alpha:1.000] : [UIColor colorWithRed:0.853 green:0.000 blue:0.000 alpha:1.000];
                              }];
}

- (BOOL)isBeatleNameValid:(NSString *)beatleName {
    NSArray *beatleNames = @[@"John", @"Paul", @"George", @"Ringo"];
    return [beatleNames containsObject:beatleName];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
