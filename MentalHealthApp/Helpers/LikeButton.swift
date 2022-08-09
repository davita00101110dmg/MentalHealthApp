//
//  LikeButton.swift
//  MentalHealthApp
//
//  Created by Dato Khvedelidze on 06.08.22.
//

import UIKit

// Custom like button with animation
// Used from: https://betterprogramming.pub/recreating-instagrams-like-%EF%B8%8F-animation-in-swift-6b95f74c9593
class LikeButton: UIButton {
    var isLiked = false
    
    
    private let unlikedScale: CGFloat = 0.7
    private let likedScale: CGFloat = 1.3

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setTitle("", for: .normal)
        setImage(heartEmpty, for: .normal)
    }
    
    public func flipLikedState() {
      isLiked.toggle()
      animate()
    }

    // Handles animation when clicked
    private func animate() {
      UIView.animate(withDuration: 0.1, animations: {
        let newImage = self.isLiked ? heartFilled : heartEmpty
        let newScale = self.isLiked ? self.likedScale : self.unlikedScale
        self.transform = self.transform.scaledBy(x: newScale, y: newScale)
        self.setImage(newImage, for: .normal)
      }, completion: { _ in
        UIView.animate(withDuration: 0.1, animations: {
          self.transform = CGAffineTransform.identity
        })
      })
    }

}
