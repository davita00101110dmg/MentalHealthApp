//
//  RegistrationViewController.swift
//  MentalHealthApp
//
//  Created by Dato Khvedelidze on 30.07.22.
//

import UIKit

class RegistrationViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var lastnameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    @IBOutlet weak var registrationOutcomeLabel: UILabel!
    
    @IBOutlet weak var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupElements()
    }
    
    private func setupElements() {
        
        self.view.backgroundColor = mainColor
        
        // Hiding the outcome label.
        registrationOutcomeLabel.alpha = 0
        
        // Configuring components of the current view.
        Utilities.customLabel(titleLabel, 30, "Sign Up")
        Utilities.customTextField(nameTextField, "First Name")
        Utilities.customTextField(lastnameTextField, "Last Name")
        Utilities.customTextField(emailTextField, "Email")
        Utilities.customTextField(passwordTextField, "Password")
        Utilities.customTextField(confirmPasswordTextField, "Confirm Password")
        Utilities.customLabel(registrationOutcomeLabel, 22, "")
        Utilities.customButton(signupButton, "Sign Up")
        
    }

    @IBAction func signupButtonPressed(_ sender: Any) {
        //TODO: 1. validate if all fields are filled && they are filled correctly.
        //TODO: 2. in case of success register user and send data to the firebase database
        //TODO: 3. return to the login vc.
    }
    
}
