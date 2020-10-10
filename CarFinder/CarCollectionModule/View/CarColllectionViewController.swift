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
		layout.estimatedItemSize = CGSize(width: view.frame.width - 20, height: 150)
		
		let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
		cv.delegate = self
		cv.backgroundColor = .white
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
		navigationItem.title = "Машины"		
		let barButton = UIBarButtonItem(image: UIImage(named: "camera"), 
										style: .plain, 
										target: self, 
										action: #selector(cameraButtonPressed))
		self.navigationItem.rightBarButtonItem = barButton		
		view.addSubview(carCollectionView)
		carCollectionView.snp.makeConstraints { (make) in
			make.edges.equalToSuperview()
		}
	}
	
	@objc private func cameraButtonPressed() {
		
	}
}

extension CarCollectionViewController: UICollectionViewDelegate {
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		
	}
}
