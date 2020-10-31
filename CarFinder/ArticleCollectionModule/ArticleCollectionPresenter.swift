//
//  CarCollectionPresenter.swift
//  CarFinder
//
//  Created by Даниил Смирнов on 09.10.2020.
//  Copyright © 2020 Антон Огурцов. All rights reserved.
//

import UIKit

class ArticleCollectionPresenter: NSObject {
		
	let cars: [Car]
	
	init(cars: [Car]) {
		self.cars = cars
	}
}

extension ArticleCollectionPresenter: UICollectionViewDataSource {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return cars.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ArticleCollectionViewCell.idenitifier, 
															for: indexPath) as? ArticleCollectionViewCell else {
			assert(false, "Could not dequeue cell with id \(ArticleCollectionViewCell.idenitifier)")
			return UICollectionViewCell()
		}
		let car = cars[indexPath.row]
		
		cell.carNameLabel.text = car.titleRus
		cell.carMinPriceLabel.text = ""
		cell.additionalInfoLabel.text = car.makeShortDescription()
		return cell
	}
} 
