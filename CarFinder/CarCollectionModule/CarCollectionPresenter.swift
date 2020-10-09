//
//  CarCollectionPresenter.swift
//  CarFinder
//
//  Created by Даниил Смирнов on 09.10.2020.
//  Copyright © 2020 Антон Огурцов. All rights reserved.
//

import UIKit

class CarCollectionPresenter: NSObject {
		
}

extension CarCollectionPresenter: UICollectionViewDataSource {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 50 
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarCollectionViewCell.idenitifier, 
															for: indexPath) as? CarCollectionViewCell else {
			assert(false, "Could not dequeue cell with id \(CarCollectionViewCell.idenitifier)")
			return UICollectionViewCell()
		}
		
		cell.label.text = "\(indexPath.row)"
		return cell
	}
} 
