//
//  ModuleViewController.swift
//  Clean
//
//  Created by Kaplan Deniz on 28/11/2019.
//  Copyright © 2019 DK. All rights reserved.
//

import UIKit

final class ModuleViewController: UIViewController {

	var interactor: ModuleBusinessLogic?

	override func viewDidLoad() {
		super.viewDidLoad()

		setupUI()

		let request = ModuleRequest(.text)
		interactor?.fetch(request)
	}

	private let label: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.numberOfLines = 0
		label.textColor = .black
		label.font = UIFont.systemFont(ofSize: 34, weight: .bold)
		return label
	}()

	private let imageView: UIImageView = {
		let imageView = UIImageView()
		imageView.layer.cornerRadius = 44
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()

	private var viewModel: ModuleViewModel? {
		didSet {
			updatePresentation()
		}
	}
}

// MARK: - <ModuleDisplayLogic>
extension ModuleViewController: ModuleDisplayLogic {

	func update(_ viewModel: ModuleViewModel) {
		self.viewModel = viewModel
	}
}

// MARK: - Private
private extension ModuleViewController {

	func updatePresentation() {
		label.text = viewModel?.title
		imageView.image = viewModel?.image
	}

	func setupUI() {
		view.addSubview(label)
		view.addSubview(imageView)

		NSLayoutConstraint.activate([
			label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			imageView.bottomAnchor.constraint(equalTo: label.topAnchor, constant: -24),
			imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			imageView.widthAnchor.constraint(equalToConstant: 88),
			imageView.heightAnchor.constraint(equalToConstant: 88)
			])
	}
}
