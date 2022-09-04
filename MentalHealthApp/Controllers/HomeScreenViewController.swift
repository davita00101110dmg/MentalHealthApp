//
//  HomeScreemViewController.swift
//  MentalHealthApp
//
//  Created by Dato Khvedelidze on 30.07.22.
//

import UIKit
import Firebase
import FirebaseFirestore


class HomeScreenViewController: UIViewController {
    
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var quoteHeaderLabel: UILabel!
    @IBOutlet weak var quoteLabel: UILabel!
    
    @IBOutlet weak var likeButtonOutlet: LikeButton!
    @IBOutlet weak var generateButtonOutlet: UIButton!
    
    var user: User? {
        didSet {
            userLabel.text = "Welcome, \(user!.firstname) \n How are you feeling today?"
        }
    }
    
    var quote: Quote?
    var networkService = NetworkService.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchUser()
        setupElements()
    }
    
    private func fetchUser() {
        UserService.fetchUser { user in
            self.user = user
        }
    }
    
    private func setupElements() {
        self.view.backgroundColor = Color.lightGreenColor
        
        // Configuring image
        imageView.image = Image.cuteBrain
        imageView.contentMode = .scaleAspectFit
        
        likeButtonOutlet.isHidden = true
        
        // Configuring components of the current view.
        Utilities.customLabel(for: userLabel, size: 24, text: "Welcome, \n How are you feeling today?")
        setupQuoteLabel()
        Utilities.customLabel(for: quoteHeaderLabel, size: 22, text: "Today's quote👇🏻")
        
        //TODO: put quote here
        Utilities.customLabel(for: quoteLabel, size: 20, text: "Press Next button to generate new quote")
        Utilities.customButton(for: generateButtonOutlet, title: "Next", cornerRadius: 20, color: Color.greenColor)
        
        
    }
    
    private func setupQuoteLabel() {
        quoteLabel.layer.borderWidth = 0.5
        quoteLabel.layer.cornerRadius = 20
        quoteLabel.layer.backgroundColor = Color.whiteColor.cgColor
    }
    
    @IBAction func likeButtonAction(_ sender: Any) {
        // Calling function which will handle the animation of the like button
        
        guard let quote = quote?.content else { return }
        let flag = likeButtonOutlet.isLiked

        likeButtonOutlet.flipLikedState()
        
        UserService.updateLikedQuotesArray(condition: flag, quote: quote)

    }
    
    @IBAction func generateButtonAction(_ sender: Any) {
        
        if likeButtonOutlet.isLiked {
            likeButtonOutlet.flipLikedState()
        }
        
        Task {
            let response = await networkService.fetchQuotes()
            
            switch response {
            case .success(let quote):
                self.quote = quote
                self.likeButtonOutlet.isHidden = false
                self.quoteLabel.text = quote.content + "\n -" + quote.author
                
            case .failure(_):
                print(ApiError.decodingError)
            }
        }
        
    }
    
}
