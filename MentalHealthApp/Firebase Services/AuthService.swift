//
//  AuthService.swift
//  MentalHealthApp
//
//  Created by Dato Khvedelidze on 31.08.22.
//

import UIKit
import Firebase
import FirebaseAuth

//MARK: - Authentication service

struct AuthService {
    
    // MARK: - Sign in
    
    static func loginUser(withEmail email: String, password: String, completion: @escaping ((AuthDataResult?, Error?) -> Void)) {
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }
    
    // MARK: - Log out
    
    static func logoutUser(viewController: UIViewController) {
        do {
            try Auth.auth().signOut()
            
            let rootNavVC = viewController.storyboard?.instantiateViewController(withIdentifier: "rootNavigationController")
            
            viewController.view.window?.rootViewController = rootNavVC
            viewController.view.window?.makeKeyAndVisible()
        } catch {
            //TODO: handle the erorr in the better way
            print(error)
            
        }
    }
    
    // MARK: - Registration
    
    static func registerUser(withEmail email: String, password: String, completion: @escaping ((AuthDataResult?, Error?) -> Void)) {
        Auth.auth().createUser(withEmail: email, password: password, completion: completion)
    }
}
