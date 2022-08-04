//
//  Extensions.swift
//  MentalHealthApp
//
//  Created by Dato Khvedelidze on 30.07.22.
//

import UIKit

// Add font functions on UIFont for easier usage.
extension UIFont {
    static func appRegularFontWith(size: CGFloat) -> UIFont {
        return UIFont(name: "Alegreya-Regular", size: size)!
    }
    
    static func appRegularBoldFontWith(size: CGFloat) -> UIFont {
        return UIFont(name: "Alegreya-Bold", size: size)!
    }
    
    static func appSecondaryFontWith(size: CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-Regular", size: size)!
    }
    
}

// Reach out text fields whose return button was pressed.
extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Calling function to make return key switch on next textfield
        self.switchBasedNextTextField(textField)
        return true
    }
    
}

extension RegistrationViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.switchBasedNextTextField(textField)
        return true
    }
    
}

// Add function on UIImage for resizing icons to needed size
extension UIImage {
    func imageResized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
