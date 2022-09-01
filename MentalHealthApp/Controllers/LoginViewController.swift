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
    @IBOutlet weak var registerSuggestionLabel: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var signInButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTextFieldDelegates()
        setupElements()
    }
    
    private func setupTextFieldDelegates() {
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
    }
    
    private func setupElements() {
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = Color.mainColor
        
        // Hiding the error label.  
        errorLabel.alpha = 0
        
        // Adding icon to the home page.
        imageView.image = UIImage(named: "Logo")
        
        // Configuring components of the current view.
        Utilities.customLabel(for: titleLabel, size: 28, text: "Mental Health App")
        Utilities.customTextField(for: emailTextField, placeholder: "Email")
        Utilities.customTextField(for: passwordTextField, placeholder: "Password")
        Utilities.customLabel(for: registerSuggestionLabel, size: 20, text: "Don't have an account? Sign up here!")
        Utilities.customLabel(for: errorLabel, size: 20, text: "Please provide a password which will contain valid creditals")
        Utilities.customButton(for: signInButton, title: "Login", cornerRadius: 20, color: Color.redColor)
        Utilities.highlightedText(for: registerSuggestionLabel, text: "Sign up")
        
        // Setting up gesture to hide keyboard when pressed anywhere else.
        Utilities.setupTapGestureHideKeyboard(self)
        
        // Setting up gesture for the label which will lead to registration VC.
        Utilities.setupTapGestureToChangeView(self, registerSuggestionLabel, #selector(gestureTapped))
        
    }
    
    internal func switchBasedNextTextField(for textField: UITextField) {
        // Setting up switch statement to determine which textfield's return key was pressed and if it's not last move to the next one. If last hide the keyboard
        switch textField {
        case self.emailTextField:
            self.passwordTextField.becomeFirstResponder()
        default:
            self.view.endEditing(true)
        }
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
            Utilities.showOutcume(for: errorLabel, message: error!, isError: true)
        } else {
            
            // Creating cleaned versions of the text fields
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Trying to sign in
            AuthService.loginUser(withEmail: email, password: password) { result, error in
                if error != nil {
                    // Can't sign in
                    Utilities.showOutcume(for: self.errorLabel, message: "\(error!.localizedDescription)", isError: true)
                } else {
                    // Signed in
                    Utilities.showOutcume(for: self.errorLabel, message: "You've succesfully logged in!", isError: false)
                    
                    let tabBarController = TabBarController()
                    
                    let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeScreenViewController") as! HomeScreenViewController
                    
                    let profileVC = self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
                    
                    Utilities.setupTabBarItem(homeVC, Image.inactiveHome, Image.activeHome)
                    Utilities.setupTabBarItem(profileVC, Image.inactiveProfile, Image.activeProfile)
                    
                    homeVC.username = email
                    tabBarController.viewControllers = [homeVC, profileVC]
                    
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        self.view.window?.rootViewController = tabBarController
                        self.view.window?.makeKeyAndVisible()
//                    }
                }
            }
        }
    }
}
