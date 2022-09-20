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
        
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
        bottomLine.backgroundColor = Constant.Color.redColor.cgColor
        textfield.borderStyle = .none
        textfield.layer.addSublayer(bottomLine)
        textfield.font = UIFont.appRegularFontWith(size: 18)
        textfield.textColor = .black
        textfield.textAlignment = .center
        textfield.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : Constant.Color.grayColor])
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
        guard let mainString = label.text else { return }
        let stringToColor = text
        let range = (mainString as NSString).range(of: stringToColor)
        let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
        
        mutableAttributedString.addAttribute(.foregroundColor, value: Constant.Color.redColor, range: range)
        mutableAttributedString.addAttribute(.font, value: UIFont.appRegularBoldFontWith(size: label.font.pointSize), range: range)
        
        label.attributedText = mutableAttributedString
    }
    
    static func showOutcume(for label: UILabel, message: String, isError: Bool) {
        label.text = message
        label.alpha = 1
        label.font = UIFont.appRegularBoldFontWith(size: label.font.pointSize)
        
        label.textColor = isError ? Constant.Color.redColor : Constant.Color.greenColor
    }
    
    static func isPasswordValid(_ password: String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@ ", "^(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z]).{8,}$")
        
        return passwordTest.evaluate(with: password)
    }
    
    static func setupTapGestureToChangeView(_ controller: UIViewController, _ label: UILabel, _ selector: Selector) {
        let gestureRecognizer = UITapGestureRecognizer(target: controller, action: selector)
        gestureRecognizer.numberOfTapsRequired = 1
        gestureRecognizer.numberOfTouchesRequired = 1
        
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(gestureRecognizer)
    }
    
    static func setupTapGestureHideKeyboard(_ controller: UIViewController) {
        let tap = UITapGestureRecognizer(target: controller.view, action: #selector(UIView.endEditing))
        controller.view.addGestureRecognizer(tap)
    }

    static func setupTabBarItem(for viewController: UIViewController, _ inactiveImage: UIImage?, _ activeImage: UIImage?) {
        viewController.tabBarItem.image = inactiveImage
        viewController.tabBarItem.selectedImage = activeImage
        viewController.title = Constant.String.empty
    }
    
    static func setupTabBar(with viewControllers: [UIViewController]) -> UITabBarController {
        let tabBarController = UITabBarController(nibName: nil, bundle: nil)
        tabBarController.viewControllers = viewControllers
        tabBarController.tabBar.backgroundColor = Constant.Color.whiteColor
        tabBarController.tabBar.tintColor = .black
        tabBarController.tabBar.layer.cornerRadius = 20
        tabBarController.tabBar.layer.masksToBounds = true
        tabBarController.tabBar.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        return tabBarController
    }
    
    typealias Sheet = UIViewController & UISheetPresentationControllerDelegate

    static func setupBottomSheet<T: Sheet>(sheet: T, sheetColor: UIColor, sheetTitle: String, buttonColor: UIColor, detents: [UISheetPresentationController.Detent]) {
        if let sheet = sheet as? BottomSheetViewController {
            sheet.sheetTitle = sheetTitle
            sheet.buttonColor = buttonColor
        }
        
        sheet.view.backgroundColor = sheetColor
        sheet.sheetPresentationController?.detents = detents
        sheet.sheetPresentationController?.delegate = sheet
    }
}
