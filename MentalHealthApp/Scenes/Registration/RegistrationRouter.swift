//
//  RegistrationRouter.swift
//  MentalHealthApp
//
//  Created by Dato Khvedelidze on 03.09.22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol RegistrationRoutingLogic {
    func routeToLoginVC()
}

final class RegistrationRouter: RegistrationRoutingLogic {
    // MARK: - Clean Components

    weak var viewController: RegistrationViewController?
    
    // MARK: - Routing
    
    func routeToLoginVC() {
        let loginStoryboard = UIStoryboard(name: Constant.StoryboardIdentifier.login, bundle: nil)
        guard let destinationVC = loginStoryboard.instantiateViewController(withIdentifier: Constant.ViewControllerIdentifier.loginVC) as? LoginViewController else { return }
        guard let viewController = viewController else { return }
        navigateToLoginVC(source: viewController, destination: destinationVC)
        
    }
    
    // MARK: - Navigation
    
    func navigateToLoginVC(source: RegistrationViewController, destination: LoginViewController) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            source.navigationController?.popToRootViewController(animated: true)
        }
    }
}
