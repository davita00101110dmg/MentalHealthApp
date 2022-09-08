//
//  BottomSheetViewController.swift
//  MentalHealthApp
//
//  Created by Dato Khvedelidze on 07.08.22.
//

import UIKit

class BottomSheetViewController: UIViewController, UISheetPresentationControllerDelegate {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var yesButtonOutlet: UIButton!
    @IBOutlet weak var noButtonOutlet: UIButton!

    var sheetColor: UIColor?
    var buttonColor: UIColor?
    var sheetTitle: String?    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupElements()
    }
    
    private func setupElements() {
        Utilities.customLabel(for: questionLabel, size: 28, text: sheetTitle ?? "No title")
        Utilities.customButton(for: yesButtonOutlet, title: "Yes", cornerRadius: 10, color: buttonColor ?? Constant.Color.redColor)
        Utilities.customButton(for: noButtonOutlet, title: "No", cornerRadius: 10, color: buttonColor ?? Constant.Color.redColor)
    }

    @IBAction func yesButtonAction(_ sender: Any) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            AuthService.logoutUser(viewController: self)
        }
    }
    
    @IBAction func noButtonAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
