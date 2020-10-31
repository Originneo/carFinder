//
//  CarColllectionViewController.swift
//  CarFinder
//
//  Created by Даниил Смирнов on 09.10.2020.
//  Copyright © 2020 Антон Огурцов. All rights reserved.
//

import UIKit
import SnapKit 

class ArticleCollectionViewController: UIViewController {

	private let pickerController = UIImagePickerController()	
	var presenter: ArticleCollectionPresenter?
	
	lazy var carCollectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.estimatedItemSize = CGSize(width: view.frame.width - 20, height: 150)
		
		let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
		cv.delegate = self
		cv.backgroundColor = .white
		cv.dataSource = presenter
		cv.register(ArticleCollectionViewCell.self, 
					forCellWithReuseIdentifier: ArticleCollectionViewCell.idenitifier)
		return cv
	}()
	
	init(presenter: ArticleCollectionPresenter) {
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
		setupView()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
	}
	
	private func setupView() {
		navigationItem.title = "Статьи"
		
		view.addSubview(carCollectionView)
		carCollectionView.snp.makeConstraints { (make) in
			make.edges.equalToSuperview()
		}
	}
	
	@objc private func cameraButtonPressed() {
		let controller = UIAlertController(title: "Поиск машины по фото", 
										   message: "Выберите способ для отправки фото", 
										   preferredStyle: .actionSheet)
				
		let galleryButton = UIAlertAction(title: "Галерея", style: .default) { [weak self] (action) in
			guard let self = self else { return }
			self.present(self.pickerController, animated: true)
		}
		
		let cancelButton = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
		
		controller.addAction(galleryButton)
		controller.addAction(cancelButton)
		
		present(controller, animated: true)
	}
}

extension ArticleCollectionViewController: UICollectionViewDelegate {
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		
	}
}

extension ArticleCollectionViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	
	func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		dismiss(animated: true)
	}
	
	func imagePickerController(_ picker: UIImagePickerController,
							   didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
		guard let image = info[.editedImage] as? UIImage else {
			return
		}
		
		// Use image here
		
		dismiss(animated: true)
	}
}
