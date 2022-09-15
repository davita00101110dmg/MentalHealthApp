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
            let loginStoryboard = UIStoryboard(name: Constant.StoryboardIdentifiers.login, bundle: nil)
            let rootNavVC = loginStoryboard.instantiateViewController(withIdentifier: Constant.ViewControllerIdentifiers.rootNavVC)

            UserService.fetchUser(detach: true, completion: nil)
            try Auth.auth().signOut()
            
            viewController.view.window?.switchRootViewController(rootNavVC, animated: true, duration: 0.5, options: .transitionCrossDissolve, completion: nil)
        } catch {
            //FIXME: handle the erorr in the better way
            print(error)
            
        }
    }
    
    // MARK: - Registration
    
    static func registerUser(withEmail email: String, password: String, completion: @escaping ((AuthDataResult?, Error?) -> Void)) {
        Auth.auth().createUser(withEmail: email, password: password, completion: completion)
    }
}
