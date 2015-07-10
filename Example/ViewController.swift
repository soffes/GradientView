//
//  ViewController.swift
//  GradientView
//
//  Created by Sam Soffes on 7/19/14.
//  Copyright (c) 2014 Sam Soffes. All rights reserved.
//

import UIKit
import GradientView

class ViewController: UIViewController {
	
	@IBOutlet var gradientView: GradientView!
                            
	override func viewDidLoad() {
		super.viewDidLoad()
		
        gradientView.mode = .Radial
//        gradientView.radialGradientStartAttributes = GradientView.RadialGradientAttributes(origin: CGPoint(x: 0.25, y: 0.75), radius: nil)
//        gradientView.radialGradientEndAttributes = GradientView.RadialGradientAttributes(origin: CGPoint(x: 0.75, y: 0.25), radius: nil)
		gradientView.colors = [
//			UIColor(red: 0, green: 0, blue: 1, alpha: 1),
			UIColor.whiteColor(),
			UIColor(red: 0, green: 0, blue: 0.5, alpha: 1)
		]
		
		// You can configure the locations as well
//		gradientView.locations = [0.4, 0.6]
	}
	
	@IBAction func showAlert(sender: UIButton) {
		let alert = UIAlertController(title: "Dimming", message: "As part of iOS 7 design language, views should become desaturated when an alert view appears.", preferredStyle: .Alert)
		alert.addAction(UIAlertAction(title: "Awesome", style: .Default, handler: nil))
		presentViewController(alert, animated: true, completion: nil)
	}
}
