//
//  ViewController.swift
//  GradientView
//
//  Created by Sam Soffes on 7/19/14.
//  Copyright (c) 2014 Sam Soffes. All rights reserved.
//

import UIKit
import GradientView

final class ViewController: UIViewController {

	// MARK: - Properties
	
	@IBOutlet var gradientView: GradientView!


	// MARK: - UIViewController
                            
	override func viewDidLoad() {
		super.viewDidLoad()
		
		gradientView.colors = [
			UIColor.white,
			UIColor(red: 0, green: 0, blue: 0.5, alpha: 1)
		]
		
		// You can configure the locations as well
//		gradientView.locations = [0.4, 0.6]
	}


	// MARK: - Actions
	
	@IBAction func showAlert(_ sender: UIButton) {
		let alert = UIAlertController(title: "Dimming", message: "As part of iOS 7 design language, views should become desaturated when an alert view appears.", preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "Awesome", style: .default, handler: nil))
		present(alert, animated: true, completion: nil)
	}
}
