//
//  SAMGradientView.m
//  SAMGradientView
//
//  Created by Sam Soffes on 10/27/09.
//  Copyright (c) 2009-2013 Sam Soffes. All rights reserved.
//

#import "SAMGradientView.h"

@interface SAMGradientView ()
{
    NSArray *dimmedGradientColors;
}
@property (nonatomic) CGGradientRef gradient;

@end

@implementation SAMGradientView

#pragma mark - Accessors

@synthesize gradient = _gradient;
@synthesize dimmedGradientColors = _dimmedGradientColors;
@synthesize gradientColors = _gradientColors;
@synthesize gradientLocations = _gradientLocations;
@synthesize gradientDirection = _gradientDirection;
@synthesize topBorderColor = _topBorderColor;
@synthesize topInsetColor = _topInsetColor;
@synthesize rightBorderColor = _rightBorderColor;
@synthesize rightInsetColor = _rightInsetColor;
@synthesize bottomBorderColor = _bottomBorderColor;
@synthesize bottomInsetColor = _bottomInsetColor;
@synthesize leftBorderColor = _leftBorderColor;
@synthesize leftInsetColor = _leftInsetColor;



-(void)tintColorDidChange
{
    [super tintColorDidChange];
        
    if([super tintAdjustmentMode] == UIViewTintAdjustmentModeDimmed){
        NSArray *swapGradient = [self.gradientColors copy];
        self.gradientColors = self.dimmedGradientColors;
        self.dimmedGradientColors = swapGradient;
    }
    else if([super tintAdjustmentMode] == UIViewTintAdjustmentModeNormal)
    {
        if(self.dimmedGradientColors == nil) {
            self.dimmedGradientColors = @[[UIColor lightGrayColor], [UIColor grayColor]];
            //I return here because for some reason the view calles tintColorDidChange when first loaded.
            return;
        }
        NSArray *swapGradient = [self.gradientColors copy];
        self.gradientColors = self.dimmedGradientColors;
        self.dimmedGradientColors = swapGradient;
        
    }
}

- (void)setGradient:(CGGradientRef)gradient {
	if (_gradient) {
		CGGradientRelease(_gradient);
	}

	_gradient = gradient;
	[self setNeedsDisplay];
}


- (void)setGradientColors:(NSArray *)colors {
	_gradientColors = colors;
	[self refreshGradient];
}


- (void)setGradientLocations:(NSArray *)locations {
	_gradientLocations = locations;
	[self refreshGradient];
}


- (void)setGradientDirection:(SAMGradientViewDirection)direction {
	_gradientDirection = direction;
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
	self.gradient = nil;
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

	// Gradient
	if (self.gradient) {
		CGPoint start = CGPointMake(0.0f, 0.0f);
		CGPoint end = (self.gradientDirection == SAMGradientViewDirectionVertical ? CGPointMake(0.0f, size.height) :
					   CGPointMake(size.width, 0.0f));
		CGContextDrawLinearGradient(context, self.gradient, start, end, kNilOptions);
	}

	// Top
	if (self.topBorderColor) {
		// Top border
		CGContextSetFillColorWithColor(context, self.topBorderColor.CGColor);
		CGContextFillRect(context, CGRectMake(0.0f, 0.0f, size.width, borderWidth));

		// Top inset
		if (self.topInsetColor) {
			CGContextSetFillColorWithColor(context, self.topInsetColor.CGColor);
			CGContextFillRect(context, CGRectMake(0.0f, borderWidth, size.width, borderWidth));
		}
	}

	CGFloat sideY = self.topBorderColor ? 1.0f : 0.0f;
	CGFloat sideHeight = size.height;
	if (self.topBorderColor) {
		sideHeight -= 1.0f;
	}

	if (self.bottomBorderColor) {
		sideHeight -= 1.0f;
	}

	// Right
	if (self.rightBorderColor) {
		// Right inset
		if (self.rightInsetColor) {
			CGContextSetFillColorWithColor(context, self.rightInsetColor.CGColor);
			CGContextFillRect(context, CGRectMake(size.width - borderWidth - borderWidth, sideY, borderWidth, sideHeight));
		}

		// Right border
		CGContextSetFillColorWithColor(context, self.rightBorderColor.CGColor);
		CGContextFillRect(context, CGRectMake(size.width - borderWidth, sideY, borderWidth, sideHeight));
	}

	// Bottom
	if (self.bottomBorderColor) {
		// Bottom inset
		if (self.bottomInsetColor) {
			CGContextSetFillColorWithColor(context, self.bottomInsetColor.CGColor);
			CGContextFillRect(context, CGRectMake(0.0f, rect.size.height - borderWidth - borderWidth, size.width, borderWidth));
		}

		// Bottom border
		CGContextSetFillColorWithColor(context, self.bottomBorderColor.CGColor);
		CGContextFillRect(context, CGRectMake(0.0f, rect.size.height - borderWidth, size.width, borderWidth));
	}

	// Left
	if (self.leftBorderColor) {
		// Left inset
		if (self.leftInsetColor) {
			CGContextSetFillColorWithColor(context, self.leftInsetColor.CGColor);
			CGContextFillRect(context, CGRectMake(borderWidth, sideY, borderWidth, sideHeight));
		}

		// Left border
		CGContextSetFillColorWithColor(context, self.leftBorderColor.CGColor);
		CGContextFillRect(context, CGRectMake(0.0f, sideY, borderWidth, sideHeight));
	}
}


#pragma mark - Private

- (void)initialize {
	self.contentMode = UIViewContentModeRedraw;
}


- (void)refreshGradient {
	self.gradient = SAMGradientCreateWithColorsAndLocations(self.gradientColors, self.gradientLocations);
}

@end


#pragma mark - Drawing Functions

CGGradientRef SAMGradientCreateWithColors(NSArray *colors) {
	return SAMGradientCreateWithColorsAndLocations(colors, nil);
}


CGGradientRef SAMGradientCreateWithColorsAndLocations(NSArray *colors, NSArray *locations) {
	NSUInteger colorsCount = [colors count];
	if (colorsCount < 2) {
		return nil;
	}

	CGColorSpaceRef colorSpace = CGColorGetColorSpace([[colors objectAtIndex:0] CGColor]);

	NSMutableArray *gradientColors = [[NSMutableArray alloc] initWithCapacity:colorsCount];
	[colors enumerateObjectsUsingBlock:^(id object, NSUInteger index, BOOL *stop) {
		[gradientColors addObject:(id)[(UIColor *)object CGColor]];
	}];

	CGFloat *gradientLocations = NULL;
	NSUInteger locationsCount = [locations count];
	if (locationsCount == colorsCount) {
		gradientLocations = (CGFloat *)malloc(sizeof(CGFloat) * locationsCount);
		[locations enumerateObjectsUsingBlock:^(id object, NSUInteger index, BOOL *stop) {
			gradientLocations[index] = [object floatValue];
		}];
	}

	CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientColors, gradientLocations);

	if (gradientLocations) {
		free(gradientLocations);
	}

	return gradient;
}


void SAMDrawGradientInRect(CGContextRef context, CGGradientRef gradient, CGRect rect) {
	CGContextSaveGState(context);
	CGContextClipToRect(context, rect);
	CGPoint start = CGPointMake(rect.origin.x, rect.origin.y);
	CGPoint end = CGPointMake(rect.origin.x, rect.origin.y + rect.size.height);
	CGContextDrawLinearGradient(context, gradient, start, end, 0);
	CGContextRestoreGState(context);
}
