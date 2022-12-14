//
//  LoginModels.swift
//  MentalHealthApp
//
//  Created by Dato Khvedelidze on 02.09.22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum Login {
    // MARK: - Use cases
    
    enum UserValidation {
        struct Request {
            let email: String?
            let password: String?
        }
        
        struct Response {
            let outcome: String
            let isError: Bool
        }
        
        struct ViewModel {
            let outcome: String
            let isError: Bool
        }
    }
}
