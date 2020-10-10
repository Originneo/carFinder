//
//  AppDelegate.swift
//  CarFinder
//
//  Created by Антон Огурцов on 08.10.2020.
//  Copyright © 2020 Антон Огурцов. All rights reserved.
//

import UIKit
import Alamofire
import Realm

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var window: UIWindow?
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		window = UIWindow(frame: CGRect(origin: UIScreen.main.bounds.origin, size: UIScreen.main.bounds.size))
		
		AF.request("https://gw.hackathon.vtb.ru/vtb/hackathon/marketplace", 
				   method: .get,
				   headers: HTTPHeaders(["X-IBM-Client-Id": "a330af0f1f7709d43095790a381b358b"]))
			.validate()
		  .responseDecodable(of: Cars.self) { (response) in
			guard let cars = response.value else { return }
								
		  }
		
		let vc = RootViewController(rootViewController: CarCollectionViewController(presenter: CarCollectionPresenter(cars: [])))
		window?.rootViewController = vc
		window?.makeKeyAndVisible()
		return true
	}
}

