//
//  ModuleInteractor.swift
//  Clean
//
//  Created by Kaplan Deniz on 28/11/2019.
//  Copyright © 2019 DK. All rights reserved.
//

import Foundation
import UIKit

final class ModuleInteractor {
	var presenter: ModulePresentationLogic?
    
    //let bundle = Bundle(for: ModuleInteractor.self)
}

// MARK: - <ModuleBusinessLogic>
extension ModuleInteractor: ModuleBusinessLogic {
	func fetch(_ request: ModuleRequest) {
		var response = ModuleResponse()
		switch request.type {
		case .text:
			response.text = "Text from interactor"
		case .image:
            response.imageData = imageData()
        case .all:
            response.text = "Text from interactor"
            response.imageData = imageData()
		}
		presenter?.update(response)
	}
}

private extension ModuleInteractor {
    func imageData() -> Data? {
        //if let path = bundle.path(forResource: "homer", ofType: "png") {
        if let imageData = UIImage(named: "homer")?.pngData() {
                return imageData
            }
        //}
        return nil
    }
}
