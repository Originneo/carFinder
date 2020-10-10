//
//  CarDBO.swift
//  CarFinder
//
//  Created by Даниил Смирнов on 10.10.2020.
//  Copyright © 2020 Антон Огурцов. All rights reserved.
//

import Realm

class CarBodyDBO: RLMObject {
	
	@objc dynamic var key: Int64 = -1
	
	@objc dynamic var title: String = ""
	@objc dynamic var photo: URL! = nil
	@objc dynamic var doorsCount: Int = -1	
	
	override class func primaryKey() -> String? {
		return "key"
	}
}

class CarBrandDBO: RLMObject {

	@objc dynamic var key: Int64 = -1
	
	@objc dynamic var logo: URL! = nil
	@objc dynamic var title: String = ""
	@objc dynamic var titleRus: String = ""	
	
	override class func primaryKey() -> String? {
		return "key"
	}
}

class CarModelDBO: RLMObject {
	
	@objc dynamic var key: Int64 = -1
	
	@objc dynamic var bodies: [CarBodyDBO] = []
	@objc dynamic var brand: CarBrandDBO! = nil 
	@objc dynamic var colorsCount: Int = -1
	@objc dynamic var type: String = ""
	@objc dynamic var minimumPrice: Int64 = -1
	
	override class func primaryKey() -> String? {
		return "key"
	}
}

class CarDBO: RLMObject {
	
	@objc dynamic var key: Int64 = -1

	@objc dynamic var country: String = ""
		
	@objc dynamic var models: [CarModelDBO] = []
	
	override class func primaryKey() -> String? {
		return "key"
	}
}
