//
//  QuoteCell.swift
//  MentalHealthApp
//
//  Created by Dato Khvedelidze on 05.08.22.
//

import UIKit

class QuoteCell: UICollectionViewCell {
    
    @IBOutlet weak var quoteLabel: UILabel!
    
    @IBOutlet weak var likeButtonOutlet: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Quotes that will fill the collection view. Temprorary using placeholder
        Utilities.customLabel(for: quoteLabel, size: 18, text: "Death is nothing to us, since when we are, death has not come, and when death has come, we are not. - Epicurus")
    }
    
    @IBAction func likeButtonAction(_ sender: Any) {
        
        // Calling function which will handle the animation of the like button
        guard let button = sender as? LikeButton else { return }
        button.flipLikedState()
    }
    
}
