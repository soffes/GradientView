//
//  SAMDemoViewController.m
//  SAMGradientView
//
//  Created by Sam Soffes on 6/28/13.
//  Copyright (c) 2013 Sam Soffes. All rights reserved.
//

#import "SAMDemoViewController.h"
#import "SAMGradientView.h"

@import Darwin.Availability;

@implementation SAMDemoViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.title = @"Gradient View";
	
	SAMGradientView *gradientView = [[SAMGradientView alloc] initWithFrame:CGRectMake(20.0f, 20.0f, 280.0f, 280.0f)];
	gradientView.gradientColors = @[
		[UIColor colorWithRed:0.0f green:0.0f blue:1.0f alpha:1.0f],
		[UIColor colorWithRed:0.0f green:0.0f blue:0.5f alpha:1.0f]
	];
	[self.view addSubview:gradientView];

#ifdef __IPHONE_7_0
    UIButton *showAlertButton = [[UIButton alloc] initWithFrame:CGRectMake(20.0f, 320.0f, 280.0f, 30.0f)];
    [showAlertButton setTitle:@"Show Alert" forState:UIControlStateNormal];
    [showAlertButton addTarget:self action:@selector(showAlert:) forControlEvents:UIControlEventTouchUpInside];
    showAlertButton.backgroundColor = [UIColor redColor];

    [self.view addSubview:showAlertButton];
}


- (void)showAlert:(id)sender {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Gradient Dimming!"
                                                        message:@"As part of iOS7 design language, views should become desaturated when an alert view appears."
                                                       delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];
#endif
}

@end
