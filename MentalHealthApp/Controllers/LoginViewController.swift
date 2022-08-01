//
//  ViewController.swift
//  MentalHealthApp
//
//  Created by Dato Khvedelidze on 30.07.22.
//

import UIKit
import FirebaseAuth

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
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = mainColor
        
        // Hiding the error label.
        errorLabel.alpha = 0
        
        // Adding icon to the home page.
        imageView.image = UIImage(named: "icon")
        
        // Configuring components of the current view.
        Utilities.customLabel(titleLabel, 28, "Mental Health App")
        Utilities.customTextField(emailTextField, "Email")
        Utilities.customTextField(passwordTextField, "Password")
        Utilities.customLabel(forgotPasswordLabel, 20, "Forgot your password or don't have an account? Sign up here!")
        Utilities.customLabel(errorLabel, 20, "Please provide a password which will contain valid creditals")
        Utilities.customButton(signInButton, "Login")
        Utilities.highlightedText(forgotPasswordLabel, "Sign up")
        
        // Setting up gesture for the label which will lead to registration VC.
        setupTapGesture()
        
    }
    
    private func setupTapGesture() {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(gestureTapped))
        gestureRecognizer.numberOfTapsRequired = 1
        gestureRecognizer.numberOfTouchesRequired = 1
        
        forgotPasswordLabel.isUserInteractionEnabled = true
        forgotPasswordLabel.addGestureRecognizer(gestureRecognizer)
    }
    
    private func validateFields() -> String? {
        
        // Creating cleaned versions of the text fields
        let cleanedEmail = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Check if all the fields are filled in
        if cleanedEmail == "" || cleanedPassword == "" {
            return "Please fill in all fields"
        }
    
        return nil
    }
    
    @objc func gestureTapped() {
        guard let registrationVC = storyboard?.instantiateViewController(withIdentifier: "RegistrationViewController") as? RegistrationViewController else { return }
        
        self.navigationController?.pushViewController(registrationVC, animated: true)
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        // Validate login credentials
        let error = validateFields()
        
        if error != nil {
            // Error while signing in
            Utilities.showOutcume(errorLabel, error!, true)
        } else {
            
            // Creating cleaned versions of the text fields
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Trying to sign in
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                if error != nil {
                    
                    // Can't sign in
                    self.errorLabel.text = error!.localizedDescription
                    self.errorLabel.alpha = 1
                } else {
                    
                    // Signed in
                    Utilities.showOutcume(self.errorLabel, "You've succesfully logged in!", false)
                    
                    guard let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeScreenViewController") as? HomeScreenViewController else { return }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        self.view.window?.rootViewController = homeVC
                        self.view.window?.makeKeyAndVisible()
                    }
                }
            }
        }
    }
}
