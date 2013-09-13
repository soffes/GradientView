//
//  SAMGradientViewTests.m
//  SAMGradientViewTests
//
//  Created by Sam Soffes on 6/28/13.
//  Copyright (c) 2013 Sam Soffes. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>
#import "SAMGradientView.h"

@interface SAMGradientViewTests : XCTestCase
@property (nonatomic) SAMGradientView *gradientView;
@end

@implementation SAMGradientViewTests

@synthesize gradientView = _gradientView;

- (void)setUp {
	[super setUp];
	self.gradientView = [[SAMGradientView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 10.0f, 10.0f)];
	self.gradientView.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:1.0f];
}


- (void)testTopInset {
	self.gradientView.topInsetColor = [UIColor redColor];
	XCTAssertEqualObjects(self.gradientView.backgroundColor, [self colorAtPoint:CGPointMake(0.0f, 1.0f)], @"");

	self.gradientView.topBorderColor = [UIColor blueColor];
	XCTAssertEqualObjects(self.gradientView.topBorderColor, [self colorAtPoint:CGPointMake(0.0f, 0.0f)], @"");
	XCTAssertEqualObjects(self.gradientView.topInsetColor, [self colorAtPoint:CGPointMake(0.0f, 1.0f)], @"");
}


- (void)testRightBorder {
	self.gradientView.rightBorderColor = [UIColor redColor];
	XCTAssertEqualObjects(self.gradientView.rightBorderColor, [self colorAtPoint:CGPointMake(9.0f, 0.0f)], @"");
}


- (void)testBottomBorder {
	self.gradientView.bottomBorderColor = [UIColor redColor];
	XCTAssertEqualObjects(self.gradientView.bottomBorderColor, [self colorAtPoint:CGPointMake(0.0f, 9.0f)], @"");
}


- (void)testBottomInset {
	self.gradientView.bottomInsetColor = [UIColor redColor];
	XCTAssertEqualObjects(self.gradientView.backgroundColor, [self colorAtPoint:CGPointMake(0.0f, 8.0f)], @"");

	self.gradientView.bottomBorderColor = [UIColor blueColor];
	XCTAssertEqualObjects(self.gradientView.bottomBorderColor, [self colorAtPoint:CGPointMake(0.0f, 9.0f)], @"");
	XCTAssertEqualObjects(self.gradientView.bottomInsetColor, [self colorAtPoint:CGPointMake(0.0f, 8.0f)], @"");
}


- (void)testLeftBorder {
	self.gradientView.leftBorderColor = [UIColor redColor];
	XCTAssertEqualObjects(self.gradientView.leftBorderColor, [self colorAtPoint:CGPointMake(0.0f, 1.0f)], @"");
}


#pragma mark - Utilities

- (UIColor *)colorAtPoint:(CGPoint)point {
	unsigned char pixel[4] = {0};
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(pixel, 1, 1, 8, 4, colorSpace, (CGBitmapInfo)kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    CGContextTranslateCTM(context, -point.x, -point.y);
    [self.gradientView.layer renderInContext:context];
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    return [UIColor colorWithRed:pixel[0]/255.0 green:pixel[1]/255.0 blue:pixel[2]/255.0 alpha:pixel[3]/255.0];
}

@end
