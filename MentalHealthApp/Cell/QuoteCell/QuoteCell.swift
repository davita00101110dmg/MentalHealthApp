//
//  QuoteCell.swift
//  MentalHealthApp
//
//  Created by Dato Khvedelidze on 05.08.22.
//

import UIKit

final class QuoteCell: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var likeButtonOutlet: LikeButton!
    
    // MARK: - View Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupElements()
    }
    
    // MARK: - Private Methods
    
    private func setupElements() {
        Utilities.customLabel(for: quoteLabel, size: 18, text: Constant.String.empty)
        likeButtonOutlet.flipLikedState()
    }
    
    // MARK: - Actions
    
    @IBAction func likeButtonAction(_ sender: Any) {
        if let quote = quoteLabel.text {
            UserService.updateLikedQuotesArray(clikedLike: true, quote: quote)
        }
    }
}
