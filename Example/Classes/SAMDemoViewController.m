//
//  SAMDemoViewController.m
//  SAMGradientView
//
//  Created by Sam Soffes on 6/28/13.
//  Copyright (c) 2013 Sam Soffes. All rights reserved.
//

#import "SAMDemoViewController.h"
#import "SAMGradientView.h"

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
}

@end
