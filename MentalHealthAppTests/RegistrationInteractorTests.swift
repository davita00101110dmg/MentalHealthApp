//
//  RegistrationInteractorTests.swift
//  MentalHealthAppTests
//
//  Created by Dato Khvedelidze on 10.09.22.
//

import XCTest
@testable import MentalHealthApp

class RegistrationInteractorTests: XCTestCase {
    var sut: RegistrationInteractor!
    
    override func setUp() {
        sut = RegistrationInteractor()
        sut.worker = MockedRegistrationWorker()
        sut.presenter = MockedRegistrationPresenter()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func testValidateRegistrationFailure() {
        // Given
        let firstname = ""
        let lastname = ""
        let email = ""
        let password = ""
        let confirmPassword = ""
        
        // When
        sut.validateRegistration(request: Registration.RegistrationValidation.Request(
            firstname: firstname,
            lastname: lastname,
            email: email,
            password: password,
            confirmPassword: confirmPassword))
        
        // Then
        if let presenter = sut.presenter as? MockedRegistrationPresenter {
            XCTAssertTrue(presenter.presenterWasCalled, Constant.TestOutcome.Registration.presenterFailed)
        }
    }
    
    func testValidateRegistrationSuccess() {
        // Given
        let firstname = "test"
        let lastname = "test"
        let email = "test@gmail.com"
        let password = "Test12345"
        let confirmPassword = "Test12345"
        
        // When
        sut.validateRegistration(request: Registration.RegistrationValidation.Request(
            firstname: firstname,
            lastname: lastname,
            email: email,
            password: password,
            confirmPassword: confirmPassword))
        
        // Then
        if let worker = sut.worker as? MockedRegistrationWorker {
            XCTAssertTrue(worker.registerUserWasCalled, Constant.TestOutcome.Registration.workerFailed)
        }
    }
}

// MARK: - MockedRegistrationPresenter

class MockedRegistrationPresenter {
    var presenterWasCalled = false
}

extension MockedRegistrationPresenter: RegistrationPresentationLogic {
    func presentRegistrationOutcome(response: MentalHealthApp.Registration.RegistrationValidation.Response) {
        presenterWasCalled = true
    }
}

// MARK: - MockedRegistrationWorker

class MockedRegistrationWorker {
    var registerUserWasCalled = false
}

extension MockedRegistrationWorker: RegistrationWorkerLogic {
    func registerUser(withEmail email: String, password: String, firstname: String, lastname: String, completionHandler: @escaping (String, Bool) -> ()) {
        registerUserWasCalled = true
    }
}
