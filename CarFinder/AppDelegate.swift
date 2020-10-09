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
		window = UIWindow(frame: CGRect(origin: UIScreen.main.bounds.origin, size: UIScreen.main.bounds.size))
		let vc = RootViewController(rootViewController: CarCollectionViewController(presenter: CarCollectionPresenter()))
		window?.rootViewController = vc
		window?.makeKeyAndVisible()
		return true
	}
}

