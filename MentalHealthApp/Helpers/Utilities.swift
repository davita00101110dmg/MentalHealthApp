//
//  Utilities.swift
//  MentalHealthApp
//
//  Created by Dato Khvedelidze on 30.07.22.
//

import UIKit

// MARK: - Utilities

enum Utilities {
    
    static func customLabel(for label: UILabel, size fontSize: CGFloat, text: String) {
        label.textColor = .black
        label.font = UIFont.appRegularFontWith(size: fontSize)
        label.text = text
        label.textAlignment = .center
    }
    
    static func customTextField(for textfield: UITextField, placeholder: String) {
        
        let bottomLine = CALayer()
        
        // Make textfields transparent and make visible only red botttom line.
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
        bottomLine.backgroundColor = Color.redColor.cgColor
        textfield.borderStyle = .none
        textfield.layer.addSublayer(bottomLine)
        
        textfield.font = UIFont.appRegularFontWith(size: 18)
        textfield.textColor = .black
        textfield.textAlignment = .center
        textfield.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : Color.grayColor])
    }
    
    static func customButton(for button: UIButton, title: String, cornerRadius: CGFloat, color: UIColor) {
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.appRegularFontWith(size: 20)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = color
        button.layer.cornerRadius = cornerRadius
        button.tintColor = .clear
    }
    
    static func highlightedText(for label: UILabel, text: String) {
        
        // Store main text and word that will be colored in different color
        let mainString = label.text!
        let stringToColor = text
        
        let range = (mainString as NSString).range(of: stringToColor)
        
        let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
        
        // Make the word in different color and bold font.
        mutableAttributedString.addAttribute(.foregroundColor, value: Color.redColor, range: range)
        
        mutableAttributedString.addAttribute(.font, value: UIFont.appRegularBoldFontWith(size: label.font.pointSize), range: range)
        
        label.attributedText = mutableAttributedString
    }
    
    static func showOutcume(for label: UILabel, message: String, isError: Bool) {
        label.text = message
        label.alpha = 1
        label.font = UIFont.appRegularBoldFontWith(size: label.font.pointSize)
        
        if isError {
            label.textColor = Color.redColor
        } else {
            label.textColor = Color.greenColor
        }
    }
    
    // Function to check if password is secure.
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
        viewController.tabBarItem.image = inactiveImage
        viewController.tabBarItem.selectedImage = activeImage
        viewController.title = ""
    }
}
