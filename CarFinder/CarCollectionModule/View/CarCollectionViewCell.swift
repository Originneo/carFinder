//
//  CarCollectionViewCell.swift
//  CarFinder
//
//  Created by Даниил Смирнов on 09.10.2020.
//  Copyright © 2020 Антон Огурцов. All rights reserved.
//

import UIKit
import SnapKit

struct DesignSystem {
	static let borderOffset: CGFloat = 16.0
	static let spaceBetweenLabels: CGFloat = 8.0
	static let offsetBetweenCellElements: CGFloat = 8.0
}

class CarCollectionViewCell: UICollectionViewCell {
	
	static let idenitifier = "CarCollectionViewCell"
	
	lazy var carNameLabel: UILabel = {
		let label  = UILabel()
		label.numberOfLines = 1
		label.backgroundColor = .red
		return label
	}()
	
	lazy var carMinPriceLabel: UILabel = {
		let label = UILabel()
		label.backgroundColor = .yellow
		return label
	}()
	
	lazy var additionalInfoLabel: UILabel = {
		let label = UILabel()
		label.numberOfLines = 5
		label.backgroundColor = .brown
		return label
	}()
	
	lazy var carImageView: UIImageView = {
		let img = UIImageView()
		img.contentMode = .scaleAspectFit
		img.image = UIImage(named: "bmw")
		return img
	}()
	
	lazy var arrowImageView: UIImageView = {
		let img = UIImageView()
		img.backgroundColor = .green
		img.contentMode = .scaleAspectFill
		img.image = UIImage(named: "arrow")
		return img
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupView()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		contentView.layer.cornerRadius = 8
		contentView.clipsToBounds = true
	}
	
	private func setupView() {
		contentView.backgroundColor = .black
		
		contentView.addSubview(carNameLabel)
		contentView.addSubview(carImageView)
		contentView.addSubview(carMinPriceLabel)
		contentView.addSubview(additionalInfoLabel)
		contentView.addSubview(arrowImageView)
		
		arrowImageView.snp.makeConstraints { (make) in
			make.top.equalToSuperview().offset(DesignSystem.borderOffset)
			make.right.equalToSuperview().inset(DesignSystem.borderOffset)
			make.left.equalTo(carNameLabel.snp.right).offset(DesignSystem.offsetBetweenCellElements)
			make.size.equalTo(24)
		}
		
		carNameLabel.snp.makeConstraints { (make) in
			make.top.left.equalToSuperview().offset(DesignSystem.borderOffset)
		}		
		
		carMinPriceLabel.snp.makeConstraints { (make) in
			make.top.equalTo(carNameLabel.snp.bottom).offset(DesignSystem.spaceBetweenLabels)
			make.left.equalToSuperview().offset(DesignSystem.borderOffset)
			make.right.equalToSuperview().inset(DesignSystem.borderOffset)
		}		
		
		carImageView.snp.makeConstraints { (make) in
			make.top.equalTo(carMinPriceLabel.snp.bottom).offset(DesignSystem.offsetBetweenCellElements)
			make.left.equalToSuperview().offset(DesignSystem.borderOffset)
			make.right.equalToSuperview().inset(DesignSystem.borderOffset)
			make.height.equalTo(130)
			make.width.lessThanOrEqualTo(self.contentView.bounds.size.width - DesignSystem.borderOffset * 2)
		}
				
		additionalInfoLabel.snp.makeConstraints { (make) in
			make.top.equalTo(carImageView.snp.bottom).offset(DesignSystem.offsetBetweenCellElements)
			make.left.equalToSuperview().offset(DesignSystem.borderOffset)
			make.right.bottom.equalToSuperview().inset(DesignSystem.borderOffset)
		}
	}
}
