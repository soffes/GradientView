//
//  AppDelegate.swift
//  Gradient View
//
//  Created by Sam Soffes on 11/26/14.
//  Copyright (c) 2014 Sam Soffes. All rights reserved.
//

import UIKit

@UIApplicationMain final class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow? = {
		let window = UIWindow()
		window.rootViewController = UINavigationController(rootViewController: ViewController())
		return window
	}()
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        window?.makeKeyAndVisible()
    }
}
