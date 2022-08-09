//
//  HomeScreemViewController.swift
//  MentalHealthApp
//
//  Created by Dato Khvedelidze on 30.07.22.
//

import UIKit

class HomeScreenViewController: UIViewController {
    
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var quoteHeaderLabel: UILabel!
    @IBOutlet weak var quoteLabel: UILabel!
    
    @IBOutlet weak var generateButtonOutlet: UIButton!
    
    var username: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupElements()
        
    }
    
    private func setupElements() {
        self.view.backgroundColor = lightGreenColor
        
        // Configuring image
        imageView.image = cuteBrain
        imageView.contentMode = .center
        
        // Configuring components of the current view.
        Utilities.customLabel(for: userLabel, size: 28, text: "Welcome \(username), \n How are you feeling today?")
        Utilities.customLabel(for: quoteHeaderLabel, size: 25, text: "Today's quote👇🏻")
        Utilities.customLabel(for: quoteLabel, size: 22, text: "first quote")        
        Utilities.customButton(for: generateButtonOutlet, title: "Next", cornerRadius: 15, color: greenColor)

        
    }
    
    @IBAction func likeButtonAction(_ sender: Any) {
        // Calling function which will handle the animation of the like button
        guard let button = sender as? LikeButton else { return }
        button.flipLikedState()
    }
    
    @IBAction func generateButtonAction(_ sender: Any) {
        //TODO: generate new quote
    }
    
}
