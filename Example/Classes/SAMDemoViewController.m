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
	gradientView.backgroundColor = [UIColor lightGrayColor];
	gradientView.topBorderColor = [UIColor redColor];
	gradientView.bottomBorderColor = [UIColor blueColor];
	gradientView.gradientColors = @[[UIColor greenColor], [UIColor yellowColor]];
	gradientView.gradientLocations = @[@0.8, @1.0];
	[self.view addSubview:gradientView];
}

@end
