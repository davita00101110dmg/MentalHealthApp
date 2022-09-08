//
//  Constants.swift
//  MentalHealthApp
//
//  Created by Dato Khvedelidze on 30.07.22.
//

import UIKit

enum Constant {
    
    // MARK: - Colors
    
    enum Color {
        static let mainColor = UIColor(red: 252/255, green: 251/255, blue: 221/255, alpha: 1)
        static let redColor = UIColor(red: 197/255, green: 105/255, blue: 95/255, alpha: 1)
        static let greenColor = UIColor(red: 145/255, green: 163/255, blue: 98/255, alpha: 1)
        static let lightGreenColor = UIColor(red: 238/255, green: 243/255, blue: 223/255, alpha: 1)
        static let grayColor = UIColor(red: 0, green: 0, blue: 0.0980392, alpha: 0.22)
        static let whiteColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
    }
    
    
    // MARK: - Icon sizes
    
    enum ImageSize {
        static let defaultIcon = CGSize(width: 30, height: 30)
        static let biggerIcon = CGSize(width: 75, height: 75)
        static let biggestIcon = CGSize(width: 275, height: 275)
    }
    
    // MARK: - Images
    
    enum Image {
        static let activeHome = UIImage(named: "home_active")!.imageResized(to: Constant.ImageSize.defaultIcon)
        static let inactiveHome = UIImage(named: "home_inactive")!.imageResized(to: Constant.ImageSize.defaultIcon)
        static let activeProfile = UIImage(named: "user_active")!.imageResized(to: Constant.ImageSize.defaultIcon)
        static let inactiveProfile = UIImage(named: "user_inactive")!.imageResized(to: Constant.ImageSize.defaultIcon)
        static let heartEmpty = UIImage(named: "heart_empty")?.imageResized(to: Constant.ImageSize.defaultIcon)
        static let heartFilled = UIImage(named: "heart_filled")?.imageResized(to: Constant.ImageSize.defaultIcon)
        static let cuteBrain = UIImage(named: "CuteBrain")
        static let arrowTriangle = UIImage(systemName: "arrowtriangle.forward.circle.fill")?.imageResized(to: Constant.ImageSize.biggerIcon).withTintColor(Constant.Color.greenColor)
    }
    
    // MARK: - Validation Outcome
    
    enum ValidationOutcome {
        static let notAllFieldsFilled = "Please fill in all fields"
        static let passwordNotSecure = "Please make sure your password is at least 8 characters, contains a number and an uppercase letter"
        static let passwordsNotMatch = "Please make sure your passwords match"
        static let successfulLogin = "You've succesfully logged in!"
        static let successfulRegistration = "You've succesfully registered!"
    }
}
