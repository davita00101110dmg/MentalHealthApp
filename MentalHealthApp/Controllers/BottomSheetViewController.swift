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
    
    override var sheetPresentationController: UISheetPresentationController {
        presentationController as! UISheetPresentationController
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupElements()
    }
    
    private func setupElements() {
        self.view.backgroundColor = Color.lightGreenColor
        
        sheetPresentationController.delegate = self
        sheetPresentationController.detents = [.medium()]
        
        // Configuring components of the bottom sheet view.
        Utilities.customLabel(for: questionLabel, size: 28, text: "Do you really want to sign out?")
        Utilities.customButton(for: yesButtonOutlet, title: "Yes", cornerRadius: 10, color: Color.redColor)
        Utilities.customButton(for: noButtonOutlet, title: "No", cornerRadius: 10, color: Color.redColor)
    }

    @IBAction func yesButtonAction(_ sender: Any) {
        
        // Log out user after 1 second delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            AuthService.logoutUser(viewController: self)
        }
        
    }
    
    @IBAction func noButtonAction(_ sender: Any) {
        
        // In case of no just dismiss the sheet
        self.dismiss(animated: true)
    }
    
}
