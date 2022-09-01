//
//  LikeButton.swift
//  MentalHealthApp
//
//  Created by Dato Khvedelidze on 06.08.22.
//

import UIKit

// MARK: - Like Button

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
        setImage(Image.heartEmpty, for: .normal)
    }
    
    public func flipLikedState() {
      isLiked.toggle()
      animate()
    }

    // Handles animation when clicked
    private func animate() {
      UIView.animate(withDuration: 0.1, animations: {
        let newImage = self.isLiked ? Image.heartFilled : Image.heartEmpty
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
