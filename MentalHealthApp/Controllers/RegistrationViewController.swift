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
    
    @IBOutlet weak var loginSuggestionLabel: UILabel!
    
    @IBOutlet weak var registrationOutcomeLabel: UILabel!
    
    @IBOutlet weak var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupElements()
    }
    
    private func setupElements() {
    
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = mainColor
        
        // Hiding the outcome label.
        registrationOutcomeLabel.alpha = 0
        
        // Configuring components of the current view.
        Utilities.customLabel(titleLabel, 30, "Create your account")
        Utilities.customTextField(nameTextField, "First Name")
        Utilities.customTextField(lastnameTextField, "Last Name")
        Utilities.customTextField(emailTextField, "Email")
        Utilities.customTextField(passwordTextField, "Password")
        Utilities.customTextField(confirmPasswordTextField, "Confirm Password")
        Utilities.customLabel(loginSuggestionLabel, 20, "Already have an account? Sign in here!")
        Utilities.customLabel(registrationOutcomeLabel, 20, "Please fill all the fields correctly!")
        Utilities.customButton(signupButton, "Sign Up")
        Utilities.highlightedText(loginSuggestionLabel, "Sign in")
        
        // Setting up gesture for the label.
        setupTapGesture()
        
        registrationOutcomeLabel.textColor = redColor
        registrationOutcomeLabel.font = UIFont.appRegularBoldFontWith(size: registrationOutcomeLabel.font.pointSize)
        
    }
    
    private func setupTapGesture() {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(gestureTapped))
        gestureRecognizer.numberOfTapsRequired = 1
        gestureRecognizer.numberOfTouchesRequired = 1
        
        loginSuggestionLabel.isUserInteractionEnabled = true
        loginSuggestionLabel.addGestureRecognizer(gestureRecognizer)
    }
    

    
    private func validateFields() -> String? {
        
        // Check if all the fields are filled in.
        if nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastnameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            confirmPasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields."
        }
        
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let cleanedConfirmPassowrd = confirmPasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Checking if the password is secure
        if Utilities.isPasswordValid(cleanedPassword) == false {
            return "Please make sure your password is at least 8 characters, contains a number and an uppercase letter"
        }
        
        if cleanedPassword != cleanedConfirmPassowrd {
            return "Please make sure your passwords match"
        }
        
        return nil
    }
    
    private func showOutcume(_ message: String, _ error: Bool) {
        registrationOutcomeLabel.text = message
        registrationOutcomeLabel.alpha = 1
        
        if error {
            registrationOutcomeLabel.textColor = redColor
        } else {
            registrationOutcomeLabel.textColor = greenColor
        }
        
    }
    
    @objc func gestureTapped() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func signupButtonPressed(_ sender: Any) {
        
        // Validating fields
        let error = validateFields()
        
        if error != nil {
            
            // Showing error message
            showOutcume(error!, true)
        } else {
            //TODO: register user and send data to the firebase database
            
            showOutcume("You've succesfully registered!", false)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.navigationController?.popToRootViewController(animated: true)
            }
        }
    }
}
