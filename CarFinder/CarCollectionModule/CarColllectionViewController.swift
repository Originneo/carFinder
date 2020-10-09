//
//  CarColllectionViewController.swift
//  CarFinder
//
//  Created by Даниил Смирнов on 09.10.2020.
//  Copyright © 2020 Антон Огурцов. All rights reserved.
//

import UIKit
import SnapKit 

class CarCollectionViewController: UIViewController {
	
	var presenter: CarCollectionPresenter?
	
	lazy var carCollectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.itemSize = CGSize(width: view.frame.width - 20, height: 50)
		
		let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
		cv.backgroundColor = .green
		cv.delegate = self
		cv.dataSource = presenter
		cv.register(CarCollectionViewCell.self, 
					forCellWithReuseIdentifier: CarCollectionViewCell.idenitifier)
		return cv
	}()
	
	init(presenter: CarCollectionPresenter) {
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
		setupView()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
	}
	
	private func setupView() {
		view.addSubview(carCollectionView)
		carCollectionView.snp.makeConstraints { (make) in
			make.edges.equalToSuperview()
		}
	}
}

extension CarCollectionViewController: UICollectionViewDelegate {
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		
	}
}
