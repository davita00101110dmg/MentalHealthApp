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
    
    // MARK: - Fields
    
    var firstname: String!
    var lastname: String!
    var email: String!
    var password: String!
    var confirmPassword: String!
    
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
        firstname = ""
        lastname = ""
        email = ""
        password = ""
        confirmPassword = ""
        
        // When
        sut.validateRegistration(request: Registration.RegistrationValidation.Request(firstname: firstname,
                                                                                      lastname: lastname,
                                                                                      email: email,
                                                                                      password: password,
                                                                                      confirmPassword: confirmPassword))
        
        // Then
        XCTAssertTrue((sut.presenter as! MockedRegistrationPresenter).presenterWasCalled, "All fields were filled correctly therefore registerUser function will be called before the presenter will be triggered")
    }
    
    func testValidateRegistrationSuccess() {
        // Given
        firstname = "test"
        lastname = "test"
        email = "test@gmail.com"
        password = "Test12345"
        confirmPassword = "Test12345"
        
        // When
        sut.validateRegistration(request: Registration.RegistrationValidation.Request(firstname: firstname,
                                                                                      lastname: lastname,
                                                                                      email: email,
                                                                                      password: password,
                                                                                      confirmPassword: confirmPassword))
        
        // Then
        XCTAssertTrue((sut.worker as! MockedRegistrationWorker).registerUserWasCalled, "One of the following cases didn't happen to fulfil this test: 1. Not all fields were filled 2. Email was formatted badly 3. Password wasn't secure 4. Passwords didn't match")
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
