//
//  Utilities.swift
//  MentalHealthApp
//
//  Created by Dato Khvedelidze on 30.07.22.
//

import UIKit

class Utilities {
    
    static func customLabel(_ label: UILabel, _ fontSize: CGFloat, _ text: String) {
        label.textColor = .black
        label.font = UIFont.appRegularFontWith(size: fontSize)
        label.text = text
    }
    
    static func customTextField(_ textfield: UITextField, _ placeholder: String) {
        
        let bottomLine = CALayer()
        
        // Make textfields transparent and visible by only botttom line.
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
        bottomLine.backgroundColor = redColor.cgColor
        textfield.borderStyle = .none
        textfield.layer.addSublayer(bottomLine)
        
        textfield.font = UIFont.appRegularFontWith(size: 18)
        textfield.textColor = .black
        textfield.textAlignment = .center
        textfield.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : grayColor])
    }
    
    static func customButton(_ button: UIButton, _ title: String) {
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.appRegularFontWith(size: 20)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = redColor
        button.layer.cornerRadius = 20
        button.tintColor = .clear
    }
    
    static func highlightedText(_ label: UILabel, _ text: String) {
        
        // Store main text and word that will be colored in different color
        let mainString = label.text!
        let stringToColor = text
        
        let range = (mainString as NSString).range(of: stringToColor)
        
        let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
        
        // Make the word in different color and bold font.
        mutableAttributedString.addAttribute(.foregroundColor, value: redColor, range: range)
        
        mutableAttributedString.addAttribute(.font, value: UIFont.appRegularBoldFontWith(size: label.font.pointSize), range: range)
        
        label.attributedText = mutableAttributedString
    }
    
    static func showOutcume(_ label: UILabel, _ message: String, _ error: Bool) {
        label.text = message
        label.alpha = 1
        label.font = UIFont.appRegularBoldFontWith(size: label.font.pointSize)
        
        if error {
            label.textColor = redColor
        } else {
            label.textColor = greenColor
        }
    }
    
    // Function to check if password is secure.
    // Used from: https://medium.com/swlh/password-validation-in-swift-5-3de161569910
    static func isPasswordValid(_ password: String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@ ", "^(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z]).{8,}$")
        
        return passwordTest.evaluate(with: password)
    }
    
    // Function to change view depending on having or not having registered account
    static func setupTapGestureToChangeView(_ controller: UIViewController, _ label: UILabel, _ selector: Selector) {
        let gestureRecognizer = UITapGestureRecognizer(target: controller, action: selector)
        gestureRecognizer.numberOfTapsRequired = 1
        gestureRecognizer.numberOfTouchesRequired = 1
        
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(gestureRecognizer)
    }
    
    // Add tap gesture to hide keyboard when pressed anywhere else
    static func setupTapGestureHideKeyboard(_ controller: UIViewController) {
        let tap = UITapGestureRecognizer(target: controller.view, action: #selector(UIView.endEditing))
        controller.view.addGestureRecognizer(tap)
    }
    
    // Add function to setup tab bar icons
    static func setupTabBarItem(_ viewController: UIViewController, _ inactiveImage: UIImage, _ activeImage: UIImage ) {
        viewController.tabBarItem.image = inactiveImage.imageResized(to: tabBarItemSize)
        viewController.tabBarItem.selectedImage = activeImage.imageResized(to: tabBarItemSize)
        viewController.title = ""
    }
}
