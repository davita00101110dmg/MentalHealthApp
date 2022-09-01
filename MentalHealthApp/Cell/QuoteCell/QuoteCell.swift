//
//  QuoteCell.swift
//  MentalHealthApp
//
//  Created by Dato Khvedelidze on 05.08.22.
//

import UIKit
import Firebase
import FirebaseFirestore

class QuoteCell: UICollectionViewCell {
    
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var likeButtonOutlet: LikeButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        Utilities.customLabel(for: quoteLabel, size: 18, text: "")
        likeButtonOutlet.flipLikedState()
    }
    
    @IBAction func likeButtonAction(_ sender: Any) {
        UserService.updateLikedQuotesArray(condition: true, quote: quoteLabel.text!)
    }
    
}