//
//  ModuleAssembly.swift
//  Clean
//
//  Created by Kaplan Deniz on 28/11/2019.
//  Copyright © 2019 DK. All rights reserved.
//

import UIKit

final class ModuleAssembly {

	static func assemble() -> UIViewController {
		let view = ModuleViewController()
		let interactor = ModuleInteractor()
		let presenter = ModulePresenter()

		view.interactor = interactor
		presenter.view = view
		interactor.presenter = presenter

		return view
	}
}
