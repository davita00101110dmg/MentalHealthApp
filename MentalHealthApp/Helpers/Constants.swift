//
//  Constants.swift
//  MentalHealthApp
//
//  Created by Dato Khvedelidze on 30.07.22.
//

import UIKit

enum Constant {
    // MARK: - Color
    
    enum Color {
        static let mainColor = UIColor(red: 252/255, green: 251/255, blue: 221/255, alpha: 1)
        static let redColor = UIColor(red: 197/255, green: 105/255, blue: 95/255, alpha: 1)
        static let greenColor = UIColor(red: 145/255, green: 163/255, blue: 98/255, alpha: 1)
        static let lightGreenColor = UIColor(red: 238/255, green: 243/255, blue: 223/255, alpha: 1)
        static let grayColor = UIColor(red: 0, green: 0, blue: 0.0980392, alpha: 0.22)
        static let whiteColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
    }
    
    // MARK: - Icon size
    
    enum ImageSize {
        static let defaultIcon = CGSize(width: 30, height: 30)
        static let biggerIcon = CGSize(width: 75, height: 75)
        static let biggestIcon = CGSize(width: 275, height: 275)
    }
    
    // MARK: - Image
    
    enum Image {
        static let activeHome = UIImage(named: ImageIdentifier.activeHome)?.imageResized(to: ImageSize.defaultIcon)
        static let inactiveHome = UIImage(named: ImageIdentifier.inactiveHome)?.imageResized(to: ImageSize.defaultIcon)
        static let activeProfile = UIImage(named: ImageIdentifier.activeProfile)?.imageResized(to: ImageSize.defaultIcon)
        static let inactiveProfile = UIImage(named: ImageIdentifier.inactiveProfile)?.imageResized(to: ImageSize.defaultIcon)
        static let heartEmpty = UIImage(named: ImageIdentifier.heartEmpty)?.imageResized(to: ImageSize.defaultIcon)
        static let heartFilled = UIImage(named: ImageIdentifier.heartFilled)?.imageResized(to: ImageSize.defaultIcon)
        static let cuteBrain = UIImage(named: ImageIdentifier.cuteBrain)
        static let arrowTriangle = UIImage(systemName: ImageIdentifier.arrowTriangle)?.imageResized(to: ImageSize.biggerIcon).withTintColor(Color.greenColor)
    }
    
    // MARK: - Image Identifier
    
    enum ImageIdentifier {
        static let activeHome = "home_active"
        static let inactiveHome = "home_inactive"
        static let activeProfile = "user_active"
        static let inactiveProfile = "user_inactive"
        static let heartEmpty = "heart_empty"
        static let heartFilled = "heart_filled"
        static let cuteBrain = "CuteBrain"
        static let arrowTriangle = "arrowtriangle.forward.circle.fill"
        static let personCircle = "person.crop.circle"
        static let logo = "Logo"
    }
    
    // MARK: - ViewController Identifier
    
    enum ViewControllerIdentifier {
        static let loginVC = "LoginViewController"
        static let registrationVC = "RegistrationViewController"
        static let homeVC = "HomeViewController"
        static let profileVC = "ProfileViewController"
        static let bottomSheetVC = "BottomSheetViewController"
        static let rootNC = "rootNavigationController"
    }
    
    // MARK: - Storyboard Identifier
    
    enum StoryboardIdentifier {
        static let login = "Login"
        static let registration = "Registration"
        static let home = "Home"
        static let profile = "Profile"
        static let bottomSheet = "BottomSheet"
    }
    
    // MARK: - Font Identifier
    
    enum FontIdentifier {
        static let regularFont = "Alegreya-Regular"
        static let boldFont = "Alegreya-Bold"
    }
    
    // MARK: - Cell Identifier
    
    enum CellIdentifier {
        static let quoteCell = "QuoteCell"
    }
    
    // MARK: - Document Field
    
    enum DocumentField {
        static let firstname = "firstname"
        static let lastname = "lastname"
        static let uid = "uid"
        static let likedQuotes = "liked_quotes"
    }
    
    // MARK: - Validation Outcome
    
    enum ValidationOutcome {
        static let notAllFieldsFilled = "Please fill in all fields."
        static let passwordNotSecure = "Please make sure your password is at least 8 characters, contains a number and an uppercase letter."
        static let passwordsNotMatch = "Please make sure your passwords match."
        static let successfulLogin = "You've succesfully logged in!"
        static let successfulRegistration = "You've succesfully registered!"
    }
    
    // MARK: - Unit Test Outcome
    
    enum TestOutcome {
        enum Login {
            static let presenterFailed = "Both fields are filled therefore it will first call loginUser function before triggering the presenter function"
            static let workerFailed = "At least one field is empty therefore loginUser function wasn't called"
            
        }
        enum Registration {
            static let presenterFailed = "All fields were filled correctly therefore registerUser function will be called before the presenter will be triggered"
            static let workerFailed = "One of the following cases didn't happen to fulfil this test: 1. Not all fields were filled 2. Email was formatted badly 3. Password wasn't secure 4. Passwords didn't match"
        }
    }
    
    // MARK: - Other Strings
    
    enum String {
        static let appName = "Mental Health App"
        static let email = "Email"
        static let password = "Password"
        static let confirmPassowrd = "Confirm Password"
        static let firstName = "First Name"
        static let lastName = "Last Name"
        static let fullname = "Fullname"
        static let empty = ""
        static let yes = "Yes"
        static let no = "No"
        static let next = "Next"
        static let login = "Login"
        static let signIn = "Sign in"
        static let signUp = "Sign up"
        static let logout = "Logout"
        static let signoutQuestion = "Do you really want to sign out?"
        static let createAccountTitle = "Create your account"
        static let loginSuggestion = "Already have an account? Sign in here!"
        static let registerSuggestion = "Don't have an account? Sign up here!"
        static let noTitle = "No title"
        static let profile = "Profile"
        static let welcomeText = "Welcome, \n How are you feeling today?"
        static let todaysQuote = "Today's quote👇🏻"
        static let yourLikedQuotes = "Your liked quotes👇🏻"
        static let nextQuote = "Press Next button to generate new quote"
    }
}
