//
//  ModulePresenterTests.swift
//  CleanTests
//
//  Created by Alex Mikhaylov on 28/11/2019.
//  Copyright © 2019 DK. All rights reserved.
//

import XCTest
@testable import Clean

class ModulePresenterTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testThatModulePresenterUpdatesViewWithResponseText() {
        // arrange
        let modulePresenter = ModulePresenter()
        let view = MockModuleDisplayLogic()
        view.presenter = modulePresenter
        modulePresenter.view = view
        let moduleResponse = ModuleResponse(text: "test", imageData: nil)
        // act
        modulePresenter.update(moduleResponse)
        let text = view.model.title
        // assert
        XCTAssertEqual(text, moduleResponse.text)
    }
    
    func testThatModulePresenterUpdatesViewWithGivenImageData() {
        // arrange
        let modulePresenter = ModulePresenter()
        let view = MockModuleDisplayLogic()
        view.presenter = modulePresenter
        modulePresenter.view = view
        let moduleResponse = ModuleResponse(text: "test", imageData: UIImage(named: "homer")?.pngData())
        // act
        modulePresenter.update(moduleResponse)
        let image = view.model.image
        // assert
        XCTAssertNotNil(image)
    }
    
    func testThatModulePresenterDoesNotSetViewImageIfImageDataIsNil() {
        // arrange
        let modulePresenter = ModulePresenter()
        let view = MockModuleDisplayLogic()
        view.presenter = modulePresenter
        modulePresenter.view = view
        let moduleResponse = ModuleResponse(text: "test", imageData: nil)
        // act
        modulePresenter.update(moduleResponse)
        let imageData = view.model.image
        // assert
        XCTAssertNil(imageData)
    }

}

class MockModuleDisplayLogic: ModuleDisplayLogic {
    var model: ModuleViewModel!
    var presenter: ModulePresenter?
    func update(_ viewModel: ModuleViewModel) {
        model = viewModel
    }
    init() {
        self.model = ModuleViewModel()
    }
}
