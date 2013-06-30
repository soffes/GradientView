# SAMGradientView

Easily use gradients in UIKit. SAMGradientView is a simple UIView wrapper around CGGradient.

SAMGradientView is tested on iOS 6 and requires ARC. Released under the [MIT license](LICENSE).

## Example

![Screenshot](http://soff.me/PzUc/iOS%20Simulator%20Screen%20shot%20Jun%2030,%202013%205.30.40%20PM.png)

Open up the included Xcode project for an example app and the tests.

## Usage

``` objc
// Initialize a gradient view
SAMGradientView *gradientView = [[SAMGradientView alloc] initWithFrame:CGRectMake(20.0f, 20.0f, 280.0f, 280.0f)];

// Set the gradient colors
gradientView.gradientColors = @[[UIColor greenColor], [UIColor yellowColor]];

// Optionally set some locations
gradientView.gradientLocations = @[@0.8, @1.0];

// Optionally change the direction. The default is vertical.
gradientView.gradientDirection = SAMGradientViewDirectionHorizontal;

// Add some borders too if you want
gradientView.topBorderColor = [UIColor redColor];
gradientView.bottomBorderColor = [UIColor blueColor];

// Add it as a subview in all of its awesome
[self.view addSubview:gradientView];
```

See the [header](SAMGradientView/SAMGradientView.h) for full documentation.

## Installation

Simply add the files in the `SAMGradientView.h` and `SAMGradientView.m` to your project or add `SAMGradientView` to your Podfile if you're using CocoaPods.
