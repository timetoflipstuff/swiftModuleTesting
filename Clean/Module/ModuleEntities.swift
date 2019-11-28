//
//  ModuleEntities.swift
//  Clean
//
//  Created by Kaplan Deniz on 28/11/2019.
//  Copyright © 2019 DK. All rights reserved.
//

import UIKit

struct ModuleRequest {

	enum Kind {
		case text
		case image
        case all
	}

	let type: Kind

	init(_ type: Kind) {
		self.type = type
	}
}

struct ModuleResponse {
	var text: String?
	var imageData: Data?
}

struct ModuleViewModel {

	var title: String = ""
	var image: UIImage?
}
