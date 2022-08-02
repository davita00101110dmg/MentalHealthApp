//
//  RegistrationViewController.swift
//  MentalHealthApp
//
//  Created by Dato Khvedelidze on 30.07.22.
//

import UIKit
import Firebase
import FirebaseAuth

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
    
        setupTextFieldDelegates()
        setupElements()
    }
    
    private func setupTextFieldDelegates() {
        self.nameTextField.delegate = self
        self.lastnameTextField.delegate = self
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        self.confirmPasswordTextField.delegate = self
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
        
        // Setting up gesture to hide keyboard when pressed anywhere else.
        Utilities.setupTapGestureHideKeyboard(self)
        
        // Setting up gesture for the label which will lead to loginVC
        Utilities.setupTapGestureToChangeView(self, loginSuggestionLabel, #selector(gestureTapped))
        
    }
        
    internal func switchBasedNextTextField(_ textField: UITextField) {
        
        // Setting up switch statement to determine which textfield's return key was pressed and if it's not last move to the next one. If last hide the keyboard
        switch textField {
        case self.nameTextField:
            self.lastnameTextField.becomeFirstResponder()
        case self.lastnameTextField:
            self.emailTextField.becomeFirstResponder()
        case self.emailTextField:
            self.passwordTextField.becomeFirstResponder()
        case self.passwordTextField:
            self.confirmPasswordTextField.becomeFirstResponder()
        default:
            self.view.endEditing(true)
        }
    }
    
    private func validateFields() -> String? {
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let cleanedConfirmPassowrd = confirmPasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Check if all the fields are filled in.
        if nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastnameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            confirmPasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields"
        }
        
        // Checking if the password is secure
        if Utilities.isPasswordValid(cleanedPassword) == false {
            return "Please make sure your password is at least 8 characters, contains a number and an uppercase letter"
        }
        
        // Checking if passwords match
        if cleanedPassword != cleanedConfirmPassowrd {
            return "Please make sure your passwords match"
        }
        
        return nil
    }
    
    
    @objc func gestureTapped() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func signupButtonPressed(_ sender: Any) {
        
        // Validating fields
        let error = validateFields()
        
        if error != nil {
            
            // Showing error message
            Utilities.showOutcume(registrationOutcomeLabel, error!, true)
        } else {
            
            // Creating string values of textfields
            let name = self.nameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastname = self.lastnameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = self.emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = self.passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Creating the user
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                
                // Checking for errors while creating the user
                if error != nil {
                    
                    // Was an error
                    Utilities.showOutcume(self.registrationOutcomeLabel, "\(error!.localizedDescription)", true)
                } else {
                
                    // User was created succesfully storing properties in database.
                    let database = Firestore.firestore()
                    
                    database.collection("users").addDocument(data: [
                        "firstname": name,
                        "lastname": lastname,
                        "uid": result!.user.uid
                    ]) { (error) in
                        
                        if error != nil {
                            
                            Utilities.showOutcume(self.registrationOutcomeLabel, "\(error!.localizedDescription)", true)
                        }
                    }   
                    
                    // Going back to login view
                    Utilities.showOutcume(self.registrationOutcomeLabel, "You've succesfully registered!", false)
                    
                    //TODO: Fix error which is poping up after setting async for 2 seconds
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        self.navigationController?.popToRootViewController(animated: true)
//                    }
                    
                }
            }
        }
    }
}
