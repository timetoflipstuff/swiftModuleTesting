//
//  ModuleInteractorTests.swift
//  CleanTests
//
//  Created by Alex Mikhaylov on 28/11/2019.
//  Copyright © 2019 DK. All rights reserved.
//

import XCTest
@testable import Clean

class ModuleInteractorTests: XCTestCase {

    func testThatModuleInteractorReturnsOnlyTextIfRequestKindIsText() {
        // arrange
        let moduleInteractor = ModuleInteractor()
        let presentation = ModulePresentationLogicSpy()
        moduleInteractor.presenter = presentation
        let moduleRequest = ModuleRequest(.text)
        // act
        moduleInteractor.fetch(moduleRequest)
        // assert
        XCTAssertNotNil(presentation.moduleResponse?.text)
        XCTAssertNil(presentation.moduleResponse?.imageData)
    }
    
    func testThatModuleInteractorOnlySetsImageIfRequestKindIsImage() {
        // arrange
        let moduleInteractor = ModuleInteractor()
        let presentation = ModulePresentationLogicSpy()
        moduleInteractor.presenter = presentation
        let moduleRequest = ModuleRequest(.image)
        // act
        moduleInteractor.fetch(moduleRequest)
        // assert
        XCTAssertNil(presentation.moduleResponse?.text)
        XCTAssertNotNil(presentation.moduleResponse?.imageData)
    }
    
    func testThatModuleInteractorSetsBothImageAndTextIfRequestKindIsAll() {
        // arrange
        let moduleInteractor = ModuleInteractor()
        let presentation = ModulePresentationLogicSpy()
        moduleInteractor.presenter = presentation
        let moduleRequest = ModuleRequest(.all)
        // act
        moduleInteractor.fetch(moduleRequest)
        // assert
        XCTAssertNotNil(presentation.moduleResponse?.text)
        XCTAssertNotNil(presentation.moduleResponse?.imageData)
    }
    
}

class ModulePresentationLogicSpy: ModulePresentationLogic {
    var moduleResponse: ModuleResponse?
    func update(_ response: ModuleResponse) {
        moduleResponse = response
    }
    
    var model: ModuleViewModel!
    var presenter: ModulePresenter?
    func update(_ viewModel: ModuleViewModel) {
        model = viewModel
    }
    init() {
        self.model = ModuleViewModel()
        
    }
}
