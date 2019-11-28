//
//  ViewController.swift
//  Clean
//
//  Created by Kaplan Deniz on 28/11/2019.
//  Copyright © 2019 DK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
        let child = ModuleAssembly.assemble()
        self.addChild(child)
        child.view.frame = view.frame
        view.addSubview(child.view)
        child.didMove(toParent: self)
	}


}

