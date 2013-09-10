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
@property (nonatomic, strong) SAMGradientView *gradientView;
@end

@implementation SAMGradientViewTests

@synthesize gradientView = _gradientView;

- (void)setUp {
	[super setUp];
	self.gradientView = [[SAMGradientView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 10.0f, 10.0f)];
	self.gradientView.backgroundColor = [UIColor blueColor];
}


- (void)testTopInset {
	self.gradientView.topInsetColor = [UIColor redColor];
	XCTAssertEqualObjects(self.gradientView.backgroundColor, [self colorAtPoint:CGPointMake(0.0f, 1.0f)], @"");

	self.gradientView.topBorderColor = [UIColor blueColor];
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
	XCTAssertEqualObjects(self.gradientView.bottomInsetColor, [self colorAtPoint:CGPointMake(0.0f, 8.0f)], @"");
}


- (void)testLeftBorder {
	self.gradientView.leftBorderColor = [UIColor redColor];
	XCTAssertEqualObjects(self.gradientView.leftBorderColor, [self colorAtPoint:CGPointMake(0.0f, 1.0f)], @"");
}


#pragma mark - Utilities

- (UIColor *)colorAtPoint:(CGPoint)point {
	// Get image
	UIGraphicsBeginImageContextWithOptions(self.gradientView.bounds.size, self.gradientView.opaque, 1.0f);
    [self.gradientView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

	// Get the pixel at a given point
	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	unsigned char *data = malloc(image.size.height * image.size.width * 4);
	NSUInteger bytesPerPixel = 4;
	NSUInteger bytesPerRow = bytesPerPixel * image.size.width;
	NSUInteger bitsPerComponent = 8;
	CGContextRef context = CGBitmapContextCreate(data, image.size.width, image.size.height, bitsPerComponent, bytesPerRow, colorSpace, kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
	CGColorSpaceRelease(colorSpace);
	CGContextDrawImage(context, CGRectMake(0, 0, image.size.width, image.size.height), image.CGImage);
	CGContextRelease(context);
	int index = (bytesPerRow * point.y) + point.x * bytesPerPixel;

  
	// Create and return the color
  UIColor *result = [UIColor colorWithRed:(CGFloat)data[index] / 255.0f green:(CGFloat)data[index + 1] / 255.0f blue:(CGFloat)data[index + 2] / 255.0f alpha:(CGFloat)data[index + 3] / 255.0f];
	free(data);

	return result;
}

@end
