//
//  SAMGradientView.m
//  SAMGradientView
//
//  Created by Sam Soffes on 6/28/13.
//  Copyright (c) 2013 Sam Soffes. All rights reserved.
//

#import "SAMGradientView.h"

@implementation SAMGradientView {
	CGGradientRef _gradient;
}

#pragma mark - Accessors

- (void)setColors:(NSArray *)colors {
	_colors = colors;
	[self _refreshGradient];
}


- (void)setLocations:(NSArray *)locations {
	_locations = locations;
	[self _refreshGradient];
}


- (void)setDirection:(SAMGradientViewDirection)direction {
	_direction = direction;
	[self setNeedsDisplay];
}


- (void)setTopBorderColor:(UIColor *)topBorderColor {
	_topBorderColor = topBorderColor;
	[self setNeedsDisplay];
}


- (void)setTopInsetColor:(UIColor *)topInsetColor {
	_topInsetColor = topInsetColor;
	[self setNeedsDisplay];
}


- (void)setRightBorderColor:(UIColor *)rightBorderColor {
	_rightBorderColor = rightBorderColor;
	[self setNeedsDisplay];
}


- (void)setRightInsetColor:(UIColor *)rightInsetColor {
	_rightInsetColor = rightInsetColor;
	[self setNeedsDisplay];
}


- (void)setBottomBorderColor:(UIColor *)bottomBorderColor {
	_bottomBorderColor = bottomBorderColor;
	[self setNeedsDisplay];
}


- (void)setBottomInsetColor:(UIColor *)bottomInsetColor {
	_bottomInsetColor = bottomInsetColor;
	[self setNeedsDisplay];
}


- (void)setLeftBorderColor:(UIColor *)leftBorderColor {
	_leftBorderColor = leftBorderColor;
	[self setNeedsDisplay];
}


- (void)setLeftInsetColor:(UIColor *)leftInsetColor {
	_leftInsetColor = leftInsetColor;
	[self setNeedsDisplay];
}


#pragma mark - NSObject

- (void)dealloc {
	CGGradientRelease(_gradient);
	_gradient = nil;
}


#pragma mark - UIView

- (id)initWithCoder:(NSCoder *)aDecoder {
	if ((self = [super initWithCoder:aDecoder])) {
		[self initialize];
	}
	return self;
}


- (id)initWithFrame:(CGRect)frame {
	if ((self = [super initWithFrame:frame])) {
		[self initialize];
	}
	return self;
}


- (void)drawRect:(CGRect)rect {
	CGContextRef context = UIGraphicsGetCurrentContext();

	CGSize size = self.bounds.size;
	CGFloat const borderWidth = 1.0f;
	
	// Top
	if (_topBorderColor) {
		// Top border
		CGContextSetFillColorWithColor(context, _topBorderColor.CGColor);
		CGContextFillRect(context, CGRectMake(0.0f, 0.0f, size.width, borderWidth));
		
		// Top inset
		if (_topInsetColor) {
			CGContextSetFillColorWithColor(context, _topInsetColor.CGColor);
			CGContextFillRect(context, CGRectMake(0.0f, borderWidth, size.width, borderWidth));
		}
	}
	
	CGFloat sideY = _topBorderColor ? 1.0f : 0.0f;
	CGFloat sideHeight = size.height;
	if (_topBorderColor) {
		sideHeight -= 1.0f;
	}
	
	if (_bottomBorderColor) {
		sideHeight -= 1.0f;
	}
	
	// Right
	if (_rightBorderColor) {
		// Right inset
		if (_rightInsetColor) {
			CGContextSetFillColorWithColor(context, _rightInsetColor.CGColor);
			CGContextFillRect(context, CGRectMake(size.width - borderWidth - borderWidth, sideY, borderWidth, sideHeight));
		}
		
		// Right border
		CGContextSetFillColorWithColor(context, _rightBorderColor.CGColor);
		CGContextFillRect(context, CGRectMake(size.width - borderWidth, sideY, borderWidth, sideHeight));
	}
	
	// Bottom
	if (_bottomBorderColor) {
		// Bottom inset
		if (_bottomInsetColor) {
			CGContextSetFillColorWithColor(context, _bottomInsetColor.CGColor);
			CGContextFillRect(context, CGRectMake(0.0f, rect.size.height - borderWidth - borderWidth, size.width, borderWidth));
		}
		
		// Bottom border
		CGContextSetFillColorWithColor(context, _bottomBorderColor.CGColor);
		CGContextFillRect(context, CGRectMake(0.0f, rect.size.height - borderWidth, size.width, borderWidth));
	}
	
	// Left
	if (_leftBorderColor) {
		// Left inset
		if (_leftInsetColor) {
			CGContextSetFillColorWithColor(context, _leftInsetColor.CGColor);
			CGContextFillRect(context, CGRectMake(borderWidth, sideY, borderWidth, sideHeight));
		}
		
		// Left border
		CGContextSetFillColorWithColor(context, _leftBorderColor.CGColor);
		CGContextFillRect(context, CGRectMake(0.0f, sideY, borderWidth, sideHeight));
	}
	
//	CGContextRef context = UIGraphicsGetCurrentContext();
//	CGContextClipToRect(context, rect);
//	
//	// Gradient
//	if (_gradient) {
//		CGPoint start = CGPointMake(0.0f, 0.0f);
//		CGPoint end = (_direction == SAMGradientViewDirectionVertical ? CGPointMake(0.0f, rect.size.height) :
//					   CGPointMake(rect.size.width, 0.0f));
//		CGContextDrawLinearGradient(context, _gradient, start, end, 0);
//	}
//	
//	[super drawRect:rect];
}


#pragma mark - Private

- (void)initialize {
	self.contentMode = UIViewContentModeRedraw;
}


- (void)_refreshGradient {
	CGGradientRelease(_gradient);
//	_gradient = SSCreateGradientWithColorsAndLocations(_colors, _locations);
	
	// Redraw
	[self setNeedsDisplay];
}

@end
