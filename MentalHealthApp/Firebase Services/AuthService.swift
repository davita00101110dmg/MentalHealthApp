//
//  AuthService.swift
//  MentalHealthApp
//
//  Created by Dato Khvedelidze on 31.08.22.
//

import Firebase

//MARK: - Authentication service

enum AuthService {
    // MARK: - Sign in
    
    static func loginUser(withEmail email: String, password: String, completion: @escaping ((AuthDataResult?, Error?) -> Void)) {
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }
    
    // MARK: - Log out
    
    static func logoutUser(viewController: UIViewController) {
        do {
            let loginStoryboard = UIStoryboard(name: Constant.StoryboardIdentifier.login, bundle: nil)
            let rootNC = loginStoryboard.instantiateViewController(withIdentifier: Constant.ViewControllerIdentifier.rootNC)

            UserService.fetchUser(detach: true, completion: nil)
            try Auth.auth().signOut()
            
            viewController.view.window?.switchRootViewController(rootNC, animated: true, duration: 0.5, options: .transitionCrossDissolve)
        } catch { }
    }
    
    // MARK: - Registration
    
    static func registerUser(withEmail email: String, password: String, completion: @escaping ((AuthDataResult?, Error?) -> Void)) {
        Auth.auth().createUser(withEmail: email, password: password, completion: completion)
    }
}
