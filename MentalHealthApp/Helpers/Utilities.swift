//
//  Utilities.swift
//  MentalHealthApp
//
//  Created by Dato Khvedelidze on 30.07.22.
//

import UIKit

class Utilities {
    
    static func customLabel(_ label: UILabel, _ fontSize: CGFloat, _ text: String) {
        label.font = UIFont.appRegularFontWith(size: fontSize)
        
        // Storing main text and word that will be colored in different color
        let mainString = text
        let stringToColor = "Sign up"
        
        let range = (mainString as NSString).range(of: stringToColor)
        
        let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
        
        // Making the word in different color and bold font.
        mutableAttributedString.addAttribute(.foregroundColor, value: secondaryColor, range: range)
        mutableAttributedString.addAttribute(.font, value: UIFont.appRegularBoldFontWith(size: fontSize), range: range)
        
        label.attributedText = mutableAttributedString
    
    }
    
    static func customTextField(_ textfield: UITextField, _ placeholder: String) {
        
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
        bottomLine.backgroundColor = secondaryColor.cgColor
        
        textfield.borderStyle = .none
        textfield.layer.addSublayer(bottomLine)
        
        textfield.font = UIFont.appRegularFontWith(size: 18)
        textfield.placeholder = placeholder
        textfield.textAlignment = .center
        
        
        
    }
    
    static func customButton(_ button: UIButton, _ title: String) {
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.appRegularFontWith(size: 20)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = secondaryColor
        button.layer.cornerRadius = 20
        button.tintColor = .clear
        
    }
}

