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
        let email = "test"
        let password = ""

        // When
        sut.validateUser(request: Login.UserValidation.Request(email: email, password: password))
        
        // Then
        if let presenter = sut.presenter as? MockedLoginPresenter {
            XCTAssertTrue(presenter.presenterWasCalled, Constant.TestOutcome.Login.presenterFailed)
        }
    }
    
    func test_validateUserSuccess() {
        // Given
        let email = "test"
        let password = "test"
        
        // When
        sut.validateUser(request: Login.UserValidation.Request(email: email, password: password))
        
        // Then
        if let worker = sut.worker as? MockedLoginWorker {
            XCTAssertTrue(worker.loginUserWasCalled, Constant.TestOutcome.Login.workerFailed)
        }
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
