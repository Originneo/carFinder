//
//  Car.swift
//  CarFinder
//
//  Created by Даниил Смирнов on 09.10.2020.
//  Copyright © 2020 Антон Огурцов. All rights reserved.
//

import Foundation

struct CarType: Decodable {
	let title: String
	
	enum CodingKeys: String, CodingKey {
		case title
	}
	
	init(from decoder: Decoder) throws {
		let containter = try decoder.container(keyedBy: CodingKeys.self)
		title = try containter.decode(String.self, forKey: .title)
	}

}

struct CarCountry: Decodable {
	
	let title: String
	
	enum CodingKeys: String, CodingKey {
		case title
	}
	
	init(from decoder: Decoder) throws {
		let containter = try decoder.container(keyedBy: CodingKeys.self)
		title = try containter.decode(String.self, forKey: .title)
	}
}

struct CarBody: Decodable {
	
	let title: String
	let photo: URL
	let doorsCount: Int
	
	enum CodingKeys: String, CodingKey {
		case title
		case photo
		case doorsCount = "doors"
	}
	
	init(from decoder: Decoder) throws {
		let containter = try decoder.container(keyedBy: CodingKeys.self)
		title = try containter.decode(String.self, forKey: .title)
		photo = try containter.decode(URL.self, forKey: .photo)
		doorsCount = try containter.decode(Int.self, forKey: .doorsCount)
	}
}

struct CarBrand: Decodable {
	
	let country: CarCountry
	let logo: URL
	let title: String
	let titleRus: String
	
	enum CodingKeys: String, CodingKey {
		case title
		case titleRus
		case logo
		case country
	}
	
	init(from decoder: Decoder) throws {
		let containter = try decoder.container(keyedBy: CodingKeys.self)
		title = try containter.decode(String.self, forKey: .title)
		titleRus = try containter.decode(String.self, forKey: .titleRus)
		logo = try containter.decode(URL.self, forKey: .logo)
		country = try containter.decode(CarCountry.self, forKey: .country)
	}	
}

struct Car {
	
	let bodies: [CarBody]
	let brand: CarBrand
	let colorsCount: Int
	let type: CarType
	let titleRus: String
	let minimumPrice: Int64
	
	enum CodingKeys: String, CodingKey {
		case titleRus
		case bodies
		case colorsCount
		case type = "transportType"
		case brand
		case minPrice = "minprice"
	}
	
	init(from decoder: Decoder) throws {
		let containter = try decoder.container(keyedBy: CodingKeys.self)
		bodies = try containter.decode([CarBody].self, forKey: .bodies)
		titleRus = try containter.decode(String.self, forKey: .titleRus)
		brand = try containter.decode(CarBrand.self, forKey: .brand)
		type = try containter.decode(CarType.self, forKey: .type)
		colorsCount = try containter.decode(Int.self, forKey: .colorsCount)
		minimumPrice = try containter.decode(Int64.self, forKey: .minPrice)
	}	
}
