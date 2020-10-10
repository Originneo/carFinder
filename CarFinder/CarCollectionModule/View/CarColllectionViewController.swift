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

	private let pickerController = UIImagePickerController()	
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
		navigationItem.rightBarButtonItem = barButton	
		pickerController.delegate = self
		pickerController.allowsEditing = true 
		pickerController.modalPresentationStyle = .fullScreen
		pickerController.mediaTypes = ["public.image"]
		
		view.addSubview(carCollectionView)
		carCollectionView.snp.makeConstraints { (make) in
			make.edges.equalToSuperview()
		}
	}
	
	@objc private func cameraButtonPressed() {
		let controller = UIAlertController(title: "Поиск машины по фото", 
										   message: "Выберите способ для отправки фото", 
										   preferredStyle: .actionSheet)
		
		let arButton = UIAlertAction(title: "Дополненная реальность", style: .default) { [weak self] (action) in
			
		}
		
		let galleryButton = UIAlertAction(title: "Галерея", style: .default) { [weak self] (action) in
			guard let self = self else { return }
			self.present(self.pickerController, animated: true)
		}
		
		let cancelButton = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
		
		controller.addAction(arButton)
		controller.addAction(galleryButton)
		controller.addAction(cancelButton)
		
		present(controller, animated: true)
	}
}

extension CarCollectionViewController: UICollectionViewDelegate {
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		
	}
}

extension CarCollectionViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	
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
