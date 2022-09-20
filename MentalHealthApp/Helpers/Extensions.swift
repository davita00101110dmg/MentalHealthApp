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
        guard let font = UIFont(name: Constant.FontIdentifier.regularFont, size: size) else { return .init() }
        return font
    }
    
    static func appRegularBoldFontWith(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: Constant.FontIdentifier.boldFont, size: size) else { return .init() }
        return font
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

// MARK: - UICollectionViewCell

extension UICollectionViewCell {
    static var identifier: String { String(describing: self) }
    static var nibFile: UINib { UINib(nibName: identifier, bundle: nil) }
}

// MARK: - UICollectionView

extension UICollectionView {
    func registerNib<T: UICollectionViewCell>(class: T.Type) {
        self.register(T.nibFile, forCellWithReuseIdentifier: T.identifier)
    }
}

// MARK: - UIWindow

extension UIWindow {
    func switchRootViewController(_ viewController: UIViewController, animated: Bool = true, duration: TimeInterval = 0.5, options: UIView.AnimationOptions = .transitionFlipFromRight) {
        guard animated else {
            rootViewController = viewController
            return
        }
        
        UIView.transition(with: self, duration: duration, options: options, animations: {
            let oldState = UIView.areAnimationsEnabled
            UIView.setAnimationsEnabled(false)
            self.rootViewController = viewController
            UIView.setAnimationsEnabled(oldState)
        })
    }
}
