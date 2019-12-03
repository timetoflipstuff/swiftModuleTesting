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

    func testThatModulePresenterUpdatesViewWithResponseText() {
        // arrange
        let modulePresenter = ModulePresenter()
        let view = ModuleDisplayLogicSpy()
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
        let view = ModuleDisplayLogicSpy()
        view.presenter = modulePresenter
        modulePresenter.view = view
        let moduleResponse = ModuleResponse(text: "test", imageData: UIImage(named: "homer", in: Bundle(for: ModuleInteractor.self), compatibleWith: nil)?.pngData())
        // act
        modulePresenter.update(moduleResponse)
        let image = view.model.image
        // assert
        XCTAssertNotNil(image)
    }
    
    func testThatModulePresenterDoesNotSetViewImageIfImageDataIsNil() {
        // arrange
        let modulePresenter = ModulePresenter()
        let view = ModuleDisplayLogicSpy()
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

class ModuleDisplayLogicSpy: ModuleDisplayLogic {
    var model: ModuleViewModel!
    var presenter: ModulePresenter?
    func update(_ viewModel: ModuleViewModel) {
        model = viewModel
    }
    init() {
        self.model = ModuleViewModel()
    }
}
