//
//  Extensions.swift
//  MentalHealthApp
//
//  Created by Dato Khvedelidze on 30.07.22.
//

import UIKit

// MARK: - UIFont

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

// MARK: - UITextFieldDelegate

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

// MARK: - UIImage

extension UIImage {
    
    func imageResized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}

// MARK: - UICollectionView register function

extension UICollectionView {
    
    func registerNib<T: UICollectionViewCell>(class: T.Type) {
        self.register(T.nibFile, forCellWithReuseIdentifier: T.identifier)
    }
}

// MARK: - UICollectionViewCell

extension UICollectionViewCell {
    
    static var identifier: String { String(describing: self) }
    static var nibFile: UINib {
        UINib(nibName: identifier, bundle: nil)
    }
}

