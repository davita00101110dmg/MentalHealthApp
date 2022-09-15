//
//  LoginRouter.swift
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

protocol LoginRoutingLogic {
    func routeToRegistrationVC()
    func routeToTabBarVC()
}

final class LoginRouter: LoginRoutingLogic {
    // MARK: - Clean Components
    
    weak var viewController: LoginViewController?
    private let storyboard = UIStoryboard(name: "Main", bundle: nil)

    // MARK: - Routing
    
    func routeToRegistrationVC() {
        let registrationVC = storyboard.instantiateViewController(withIdentifier: "RegistrationViewController") as! RegistrationViewController
        navigateToRegistrationVC(source: viewController!, destination: registrationVC)
    }
    
    func routeToTabBarVC() {
        //TODO: ask about this 👇🏻
        let tabBarController = UITabBarController(nibName: nil, bundle: nil)
        guard let homeVC = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController else { return }
        guard let profileVC = storyboard.instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController else { return }
        
        Utilities.setupTabBar(for: tabBarController, with: [homeVC, profileVC])
        Utilities.setupTabBarItem(for: homeVC, Constant.Image.inactiveHome, Constant.Image.activeHome)
        Utilities.setupTabBarItem(for: profileVC, Constant.Image.inactiveProfile, Constant.Image.activeProfile)
        
        navigateToTabBarVC(source: viewController!, destination: tabBarController)
    }
    
    // MARK: - Navigation
    
    func navigateToRegistrationVC(source: LoginViewController, destination: RegistrationViewController) {
        source.navigationController?.pushViewController(destination, animated: true)
    }
    
    func navigateToTabBarVC(source: LoginViewController, destination: UITabBarController) {
        //FIXME: move out in interactor somehow
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            source.view.window?.switchRootViewController(destination, animated: true, duration: 0.5, options: .transitionCrossDissolve, completion: nil)
        }
    }
}