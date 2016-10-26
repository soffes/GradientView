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

	let gradientView = GradientView()


	// MARK: - UIViewController

	override func loadView() {
		view = gradientView
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		title = "Gradient View"
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Dim", style: .plain, target: self, action: #selector(showAlert))

		gradientView.colors = [
			.white,
			UIColor(red: 0, green: 0, blue: 0.5, alpha: 1)
		]

		// You can configure the locations as well
		//		gradientView.locations = [0.4, 0.6]

		//Radial options
		//		gradientView.mode = .radial
		//		gradientView.radialGradientStartAttributes = GradientView.RadialGradientAttributes(origin: CGPoint(x: 0.25, y: 0.75), radius: 1, size: (max(gradientView.bounds.size.width, gradientView.bounds.height) * 1.5 / 2))
		//		gradientView.radialGradientEndAttributes = GradientView.RadialGradientAttributes(origin: CGPoint(x: 0.75, y: 0.25))

	}


	// MARK: - Actions

	@objc private func showAlert() {
		let alert = UIAlertController(title: "Dimming", message: "As part of iOS design language, views should become desaturated when an alert view appears.", preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "Awesome", style: .default, handler: nil))
		present(alert, animated: true, completion: nil)
	}
}
