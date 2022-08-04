//
//  ProfileViewController.swift
//  MentalHealthApp
//
//  Created by Dato Khvedelidze on 30.07.22.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var logoutButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupElements()
    }
    
    private func setupElements() {
        self.view.backgroundColor = lightGreen
        
        logoutButton.setTitle("Logout", for: .normal)
    }
    
    @IBAction func logoutAction(_ sender: Any) {
        // TODO: make alert do you really want to sign out?
        let rootNavVC = storyboard?.instantiateViewController(withIdentifier: "rootNavigationController")

        self.view.window?.rootViewController = rootNavVC
        self.view.window?.makeKeyAndVisible()
    }

}
