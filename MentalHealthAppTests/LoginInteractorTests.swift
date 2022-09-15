//
//  LoginInteractorTests.swift
//  MentalHealthAppTests
//
//  Created by Dato Khvedelidze on 10.09.22.
//

import XCTest
@testable import MentalHealthApp

class LoginInteractorTests: XCTestCase {
    var sut: LoginInteractor!
    
    // MARK: - Fields
    
    var email: String!
    var password: String!
    
    override func setUp() {
        sut = LoginInteractor()
        sut.worker = MockedLoginWorker()
        sut.presenter = MockedLoginPresenter()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func test_validateUserFailure() {
        // Given
        email = "test"
        password = ""

        // When
        sut.validateUser(request: Login.UserValidation.Request(email: email, password: password))
        
        // Then
        XCTAssertTrue((sut.presenter as! MockedLoginPresenter).presenterWasCalled, "Both fields are filled therefore it will first call loginUser function before triggering the presenter function")
    }
    
    func test_validateUserSuccess() {
        // Given
        email = "test"
        password = "test"
        
        // When
        sut.validateUser(request: Login.UserValidation.Request(email: email, password: password))
        
        // Then
        XCTAssertTrue((sut.worker as! MockedLoginWorker).loginUserWasCalled, "At least one field is empty therefore loginUser function wasn't called")
    }
}

// MARK: - MockedLoginPresenter

class MockedLoginPresenter {
    var presenterWasCalled = false
}

extension MockedLoginPresenter: LoginPresentationLogic {
    func presentUserValidationOutcome(response: MentalHealthApp.Login.UserValidation.Response) {
        presenterWasCalled = true
    }
}

// MARK: - MockedLoginWorker

class MockedLoginWorker {
    var loginUserWasCalled = false
}

extension MockedLoginWorker: LoginWorkerLogic {
    func loginUser(email: String, password: String, completionHandler: @escaping (String, Bool) -> ()) {
        loginUserWasCalled = true
    }
}
