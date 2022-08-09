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
        self.switchBasedNextTextField(for: textField)
        return true
    }
    
}

extension RegistrationViewController: UITextFieldDelegate {
    
    //MARK: double check in documentation
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.switchBasedNextTextField(for: textField)
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

// Extension to reach cell easier
extension UICollectionViewCell {
    
    static var identifier: String { String(describing: self) }
    static var nibFile: UINib {
        UINib(nibName: identifier, bundle: nil)
    }
}

// Extension to register cell easier
extension UICollectionView {
    
    func registerNib<T: UICollectionViewCell>(class: T.Type) {
        self.register(T.nibFile, forCellWithReuseIdentifier: T.identifier)
    }
}
