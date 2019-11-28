//
//  ModuleProtocols.swift
//  Clean
//
//  Created by Kaplan Deniz on 28/11/2019.
//  Copyright © 2019 DK. All rights reserved.
//

import Foundation
// interactor -> presenter response
protocol ModuleBusinessLogic: AnyObject {
	func fetch(_ request: ModuleRequest)
}
// presenter -> view presentation data
protocol ModulePresentationLogic: AnyObject {
	func update(_ response: ModuleResponse)
}
// view -> interactor request
protocol ModuleDisplayLogic: AnyObject {
	func update(_ viewModel: ModuleViewModel)
}

// VIP = View -> Interactor -> Presenter!
