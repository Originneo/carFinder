//
//  CarCollectionViewCell.swift
//  CarFinder
//
//  Created by Даниил Смирнов on 09.10.2020.
//  Copyright © 2020 Антон Огурцов. All rights reserved.
//

import UIKit
import SnapKit

class CarCollectionViewCell: UICollectionViewCell {
	
	static let idenitifier = "CarCollectionViewCell"
	
	var label: UILabel!
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupView()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
	}
	
	private func setupView() {
		label = UILabel()
		contentView.addSubview(label)
		label.backgroundColor = .red
		label.snp.makeConstraints { (make) in
			make.edges.equalToSuperview()
		}
	}
}
