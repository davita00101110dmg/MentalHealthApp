//
//  Extensions.swift
//  MentalHealthApp
//
//  Created by Dato Khvedelidze on 30.07.22.
//

import UIKit

extension UIFont {
    
    // Adding font functions to use them in project easier.
    
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
