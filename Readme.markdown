# GradientView

Easily use gradients in UIKit. GradientView is a simple UIView wrapper around CGGradient.

GradientView is tested on iOS 7-8 and requires ARC. Released under the [MIT license](LICENSE).

## Example

![Screenshot](http://soff.me/PzUc/iOS%20Simulator%20Screen%20shot%20Jun%2030,%202013%205.30.40%20PM.png)

Open up the included Xcode project for an example app and the tests.

## Usage

``` swift
// Initialize a gradient view
let gradientView = GradientView(frame: CGRectMake(x: 20, y: 20, width: 280, height: 280))

// Set the gradient colors
gradientView.colors = [UIColor.greenColor(), UIColor.yellowColor()]

// Optionally set some locations
gradientView.locations = [0.8, 1.0]

// Optionally change the direction. The default is vertical.
gradientView.direction = .Horizontal

// Add some borders too if you want
gradientView.topBorderColor = UIColor.redColor()
gradientView.bottomBorderColor = UIColor.blueColor()

// Add it as a subview in all of its awesome
view.addSubview(gradientView)
```

See the [source](GradientView.swift) for full documentation.

## Installation

Simply add the files in the `GradientView.swift` to your project.
