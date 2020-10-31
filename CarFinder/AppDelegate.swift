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
import SSCustomTabbar

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var window: UIWindow?
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		window = UIWindow(frame: CGRect(origin: UIScreen.main.bounds.origin, size: UIScreen.main.bounds.size))
				
		let vc = RootViewController()
		let articleVc = ArticleCollectionViewController(presenter: ArticleCollectionPresenter(cars: []))
		let item = UITabBarItem()
		item.title = "Статьи"
		item.image = UIImage(named: "article")
		articleVc.tabBarItem = item
		
		let mapVc = MapViewController()
		let mapItem = UITabBarItem()
		mapItem.title = "Карта"
		mapItem.image = UIImage(named: "map")
		mapVc.tabBarItem = mapItem
		
		let newsVc = NewsCollectionViewController(collectionViewLayout: UICollectionViewLayout())
		let newsItem = UITabBarItem()
		newsItem.title = "Новости"
		newsItem.image = UIImage(named: "globe")
		newsVc.tabBarItem = newsItem

		let chatVc = ChatListViewController()
		let chatVcItem = UITabBarItem()
		chatVcItem.title = "Чат"
		chatVcItem.image = UIImage(named: "chat")
		chatVc.tabBarItem = chatVcItem

		vc.viewControllers = [articleVc, mapVc, chatVc, newsVc]
		
		window?.rootViewController = vc
		window?.makeKeyAndVisible()
		return true
	}
}

