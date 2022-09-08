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


// MARK: - UIImage

extension UIImage {
    func imageResized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}

// MARK: - UICollectionView

extension UICollectionView {
    func registerNib<T: UICollectionViewCell>(class: T.Type) {
        self.register(T.nibFile, forCellWithReuseIdentifier: T.identifier)
    }
}

// MARK: - UICollectionViewCell

extension UICollectionViewCell {
    static var identifier: String { String(describing: self) }
    static var nibFile: UINib { UINib(nibName: identifier, bundle: nil) }
}

// MARK: - UIWindow

extension UIWindow {
    func switchRootViewController(_ viewController: UIViewController,  animated: Bool = true, duration: TimeInterval = 0.5, options: UIView.AnimationOptions = .transitionFlipFromRight, completion: (() -> Void)? = nil) {
        guard animated else {
            rootViewController = viewController
            return
        }
        
        UIView.transition(with: self, duration: duration, options: options, animations: {
            let oldState = UIView.areAnimationsEnabled
            UIView.setAnimationsEnabled(false)
            self.rootViewController = viewController
            UIView.setAnimationsEnabled(oldState)
        }) { _ in
            completion?()
        }
    }
}
