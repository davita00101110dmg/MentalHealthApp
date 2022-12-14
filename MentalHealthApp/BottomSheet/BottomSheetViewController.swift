//
//  BottomSheetViewController.swift
//  MentalHealthApp
//
//  Created by Dato Khvedelidze on 07.08.22.
//

import UIKit

final class BottomSheetViewController: UIViewController, UISheetPresentationControllerDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var yesButtonOutlet: UIButton!
    @IBOutlet weak var noButtonOutlet: UIButton!
    
    // MARK: - Fields
    
    var sheetColor: UIColor?
    var buttonColor: UIColor?
    var sheetTitle: String?
    
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupElements()
    }
    
    // MARK: - Private Methods

    private func setupElements() {
        Utilities.customLabel(for: questionLabel, size: 28, text: sheetTitle ?? Constant.String.noTitle)
        Utilities.customButton(for: yesButtonOutlet, title: Constant.String.yes, cornerRadius: 10, color: buttonColor ?? Constant.Color.redColor)
        Utilities.customButton(for: noButtonOutlet, title: Constant.String.no, cornerRadius: 10, color: buttonColor ?? Constant.Color.redColor)
    }
    
    // MARK: - Actions

    @IBAction func yesButtonAction(_ sender: Any) {
        AuthService.logoutUser(viewController: self)
    }
    
    @IBAction func noButtonAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
