# Gradient View

Easily use gradients in UIKit. Gradient View is a simple UIView wrapper around CGGradient.

[![Version](https://img.shields.io/github/release/soffes/GradientView.svg)](https://github.com/soffes/GradientView/releases)
![Swift Version](https://img.shields.io/badge/swift-4.0-orange.svg)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CocoaPods compatible](https://img.shields.io/cocoapods/v/GradientView.svg)](https://cocoapods.org/pods/GradientView)


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

See the [source](GradientView/GradientView.swift) for full documentation.


## Example

<img src="Example/Screenshots/Screenshot1@2x.png" width="320" alt="Screenshot 1"> <img src="Example/Screenshots/Screenshot2@2x.png" width="320" alt="Screenshot 2">

Open up the included Xcode project for an example app.


## Installation

Gradient View supports installation with [Carthage](https://github.com/Carthage/Carthage) or [CocoaPods](https://cocoapods.org/pods/GradientView). You can also simply add [GradientView.swift](GradientView/GradientView.swift) to your project if you’d prefer.

