//
//  GradientView.swift
//  Gradient View
//
//  Created by Sam Soffes on 10/27/09.
//  Copyright (c) 2009-2014 Sam Soffes. All rights reserved.
//

import UIKit

/// Simple view for drawing gradients and borders.
@IBDesignable open class GradientView: UIView {

	// MARK: - Types

	/// The mode of the gradient.
	public enum Mode {
		/// A linear gradient.
		case linear

		/// A radial gradient.
		case radial
	}


	/// The direction of the gradient.
	public enum Direction {
		/// The gradient is vertical.
		case vertical

		/// The gradient is horizontal
		case horizontal
	}

	// Structure that conveys the attributes of a radial gradient at its start or end points
	public struct RadialGradientAttributes {
		/// The relative positioning of the center point along the view's respective axes
		public let origin: CGPoint?
		/// The size of the gradient relative to the view's bounds
		public let radius: CGFloat?
		/// The size of the gradient
		public let size: CGFloat?

		public init(origin: CGPoint?, radius: CGFloat? = nil, size: CGFloat? = nil) {
			self.origin = origin
			self.radius = radius
			self.size = size
		}
	}

	// MARK: - Properties

	/// An optional array of `UIColor` objects used to draw the gradient. If the value is `nil`, the `backgroundColor`
	/// will be drawn instead of a gradient. The default is `nil`.
	open var colors: [UIColor]? {
		didSet {
			updateGradient()
		}
	}

	/// An array of `UIColor` objects used to draw the dimmed gradient. If the value is `nil`, `colors` will be
	/// converted to grayscale. This will use the same `locations` as `colors`. If length of arrays don't match, bad
	/// things will happen. You must make sure the number of dimmed colors equals the number of regular colors.
	///
	/// The default is `nil`.
	open var dimmedColors: [UIColor]? {
		didSet {
			updateGradient()
		}
	}

	/// Automatically dim gradient colors when prompted by the system (i.e. when an alert is shown).
	///
	/// The default is `true`.
	open var automaticallyDims: Bool = true

	/// An optional array of `CGFloat`s defining the location of each gradient stop.
	///
	/// The gradient stops are specified as values between `0` and `1`. The values must be monotonically increasing. If
	/// `nil`, the stops are spread uniformly across the range.
	///
	/// Defaults to `nil`.
	open var locations: [CGFloat]? {
		didSet {
			updateGradient()
		}
	}

	/// The mode of the gradient. The default is `.Linear`.
	@IBInspectable open var mode: Mode = .linear {
		didSet {
			setNeedsDisplay()
		}
	}

	/// The direction of the gradient. Only valid for the `Mode.Linear` mode. The default is `.Vertical`.
	@IBInspectable open var direction: Direction = .vertical {
		didSet {
			setNeedsDisplay()
		}
	}

	/// 1px borders will be drawn instead of 1pt borders. The default is `true`.
	@IBInspectable open var drawsThinBorders: Bool = true {
		didSet {
			setNeedsDisplay()
		}
	}

	/// The top border color. The default is `nil`.
	@IBInspectable open var topBorderColor: UIColor? {
		didSet {
			setNeedsDisplay()
		}
	}

	/// The right border color. The default is `nil`.
	@IBInspectable open var rightBorderColor: UIColor? {
		didSet {
			setNeedsDisplay()
		}
	}

	///  The bottom border color. The default is `nil`.
	@IBInspectable open var bottomBorderColor: UIColor? {
		didSet {
			setNeedsDisplay()
		}
	}

	/// The left border color. The default is `nil`.
	@IBInspectable open var leftBorderColor: UIColor? {
		didSet {
			setNeedsDisplay()
		}
	}


	/// The attibutes of the gradient at its start (inner). Only valid for the `Mode.Radial` mode.
	///
	/// `origin` define the relative positioning of the start center point along the view's respective axes
	/// `radius` determines the size of the gradient relative to the view's bounds
	public var radialGradientStartAttributes: RadialGradientAttributes = RadialGradientAttributes(origin: CGPoint(x: 0.5, y: 0.5)) {
		didSet {
			setNeedsDisplay()
		}
	}

	/// The attibutes of the gradient at its end (outer). Only valid for the `Mode.Radial` mode.
	///
	/// `origin` define the relative positioning of the end center point along the view's respective axes
	/// `radius` determines the size of the gradient relative to the view's bounds
	///
	/// Default behavior depends on `radialGradentStartAttributes` but can be overridden for more complex radial gradients
	public var radialGradientEndAttributes: RadialGradientAttributes? {
		didSet {
			setNeedsDisplay()
		}
	}

	// MARK: - UIView

	override open func draw(_ rect: CGRect) {
		let context = UIGraphicsGetCurrentContext()
		let size = bounds.size

		// Gradient
		if let gradient = gradient {
			let options: CGGradientDrawingOptions = [.drawsAfterEndLocation]

			if mode == .linear {
				let startPoint = CGPoint.zero
				let endPoint = direction == .vertical ? CGPoint(x: 0, y: size.height) : CGPoint(x: size.width, y: 0)
				context?.drawLinearGradient(gradient, start: startPoint, end: endPoint, options: options)
			} else {
				let startOrigin = radialGradientStartAttributes.origin ?? CGPoint(x: bounds.midX, y: bounds.midY) // Default is mid screen
				let startRadiusRatio = radialGradientStartAttributes.radius ?? 0.0

				let startCenter = CGPoint(x: bounds.width * startOrigin.x, y: bounds.height * startOrigin.y)
				let startRadius: CGFloat = startRadiusRatio * min(bounds.width, bounds.height) / 2

				var endCenter = startCenter // set this to be the same as the start by default
				var endRadius = radialGradientStartAttributes.size ?? min(size.width, size.height) / 2 // Default is min value between the width|height of its own size

				if let radialEndAttributes = radialGradientEndAttributes {
					if let endOrigin = radialEndAttributes.origin {
						endCenter = CGPoint(x: bounds.width * endOrigin.x, y: bounds.height * endOrigin.y)
					}
					if let endRadiusRatio = radialEndAttributes.radius {
						endRadius = endRadiusRatio * min(bounds.width, bounds.height) / 2
					}
				}

				context?.drawRadialGradient(gradient, startCenter: startCenter, startRadius: startRadius, endCenter: endCenter, endRadius: endRadius, options: options)
			}
		}

		let screen: UIScreen = window?.screen ?? UIScreen.main
		let borderWidth: CGFloat = drawsThinBorders ? 1.0 / screen.scale: 1.0

		// Top border
		if let color = topBorderColor {
			context?.setFillColor(color.cgColor)
			context?.fill(CGRect(x: 0, y: 0, width: size.width, height: borderWidth))
		}

		let sideY: CGFloat = topBorderColor != nil ? borderWidth : 0
		let sideHeight: CGFloat = size.height - sideY - (bottomBorderColor != nil ? borderWidth : 0)

		// Right border
		if let color = rightBorderColor {
			context?.setFillColor(color.cgColor)
			context?.fill(CGRect(x: size.width - borderWidth, y: sideY, width: borderWidth, height: sideHeight))
		}

		// Bottom border
		if let color = bottomBorderColor {
			context?.setFillColor(color.cgColor)
			context?.fill(CGRect(x: 0, y: size.height - borderWidth, width: size.width, height: borderWidth))
		}

		// Left border
		if let color = leftBorderColor {
			context?.setFillColor(color.cgColor)
			context?.fill(CGRect(x: 0, y: sideY, width: borderWidth, height: sideHeight))
		}
	}

	override open func tintColorDidChange() {
		super.tintColorDidChange()

		if automaticallyDims {
			updateGradient()
		}
	}

	override open func didMoveToWindow() {
		super.didMoveToWindow()
		contentMode = .redraw
	}


	// MARK: - Private

	fileprivate var gradient: CGGradient?

	fileprivate func updateGradient() {
		gradient = nil
		setNeedsDisplay()

		let colors = gradientColors()
		if let colors = colors {
			let colorSpace = CGColorSpaceCreateDeviceRGB()
			let colorSpaceModel = colorSpace.model

			let gradientColors = colors.map { (color: UIColor) -> AnyObject! in
				let cgColor = color.cgColor
				let cgColorSpace = cgColor.colorSpace ?? colorSpace

				// The color's color space is RGB, simply add it.
				if cgColorSpace.model == colorSpaceModel {
					return cgColor as AnyObject!
				}

				// Convert to RGB. There may be a more efficient way to do this.
				var red: CGFloat = 0
				var blue: CGFloat = 0
				var green: CGFloat = 0
				var alpha: CGFloat = 0
				color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
				return UIColor(red: red, green: green, blue: blue, alpha: alpha).cgColor as AnyObject!
			} as NSArray

			gradient = CGGradient(colorsSpace: colorSpace, colors: gradientColors, locations: locations)
		}
	}

	fileprivate func gradientColors() -> [UIColor]? {
		if tintAdjustmentMode == .dimmed {
			if let dimmedColors = dimmedColors {
				return dimmedColors
			}

			if automaticallyDims {
				if let colors = colors {
					return colors.map {
						var hue: CGFloat = 0
						var brightness: CGFloat = 0
						var alpha: CGFloat = 0

						$0.getHue(&hue, saturation: nil, brightness: &brightness, alpha: &alpha)

						return UIColor(hue: hue, saturation: 0, brightness: brightness, alpha: alpha)
					}
				}
			}
		}

		return colors
	}
}
