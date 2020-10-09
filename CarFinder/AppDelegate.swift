//
//  AppDelegate.swift
//  CarFinder
//
//  Created by Антон Огурцов on 08.10.2020.
//  Copyright © 2020 Антон Огурцов. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var window: UIWindow?
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		window = UIWindow(frame: UIScreen.main.bounds)
		let vc = RootViewController()
		window?.rootViewController = vc
		window?.makeKeyAndVisible()
		return true
	}
}

