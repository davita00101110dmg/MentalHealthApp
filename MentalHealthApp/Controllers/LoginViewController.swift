//
//  ViewController.swift
//  MentalHealthApp
//
//  Created by Dato Khvedelidze on 30.07.22.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var forgotPasswordLabel: UILabel!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var signInButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupElements()
    }
    
    private func setupElements() {
    
        self.view.backgroundColor = mainColor
        
        // Hide the error label.
        errorLabel.alpha = 0
        
        // Adding icon to the home page.
        imageView.image = UIImage(named: "icon")
        
        // Configuring components of the current view.
        Utilities.customLabel(titleLabel, 28, "Mental Health App")
        Utilities.customTextField(emailTextField, "Email")
        Utilities.customTextField(passwordTextField, "Password")
        Utilities.customLabel(forgotPasswordLabel, 18, "Forgot your password or don't have an account? Sign up here!")
        Utilities.customLabel(errorLabel, 20, "Please provide a password which will contain valid creditals")
        Utilities.customButton(signInButton, "Login")
        
        // Setting up gesture for the label.
        setupTapGesture()
        
    }
    
    func setupTapGesture() {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(gestureTapped))
        gestureRecognizer.numberOfTapsRequired = 1
        gestureRecognizer.numberOfTouchesRequired = 1
        
        forgotPasswordLabel.isUserInteractionEnabled = true
        forgotPasswordLabel.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func gestureTapped() {
        //TODO: go to the registration view controller.

    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        //TODO: 1. validate login credentials. in case of success go to the new view and make it root vc.
        //TODO: 2. in case of failure make the error visible to the user.
        
    }
    
}

