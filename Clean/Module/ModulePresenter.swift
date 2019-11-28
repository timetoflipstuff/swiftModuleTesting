//
//  ModulePresenter.swift
//  Clean
//
//  Created by Kaplan Deniz on 28/11/2019.
//  Copyright © 2019 DK. All rights reserved.
//

import UIKit

final class ModulePresenter {

	weak var view: ModuleDisplayLogic?
	
}

// MARK: - <ModulePresentationLogic>
extension ModulePresenter: ModulePresentationLogic {

	func update(_ response: ModuleResponse) {
		var viewModel = ModuleViewModel()
		viewModel.title = response.text ?? ""
		if let data = response.imageData {
			viewModel.image = UIImage(data: data)
		}

		view?.update(viewModel)
	}
}



