//
//  ChatListViewController.swift
//  CarFinder
//
//  Created by Даниил Смирнов on 31.10.2020.
//  Copyright © 2020 Антон Огурцов. All rights reserved.
//

import UIKit

class ChatListViewController: UIViewController {
	

	override func viewDidLoad() {
		super.viewDidLoad()
		let chatVc = ChatViewController()
		present(chatVc, animated: true)
	}
}
