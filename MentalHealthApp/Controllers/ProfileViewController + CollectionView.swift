//
//  ProfileViewController + CollectionView.swift
//  MentalHealthApp
//
//  Created by Dato Khvedelidze on 07.08.22.
//

import UIKit

// Temprorary random values
extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuoteCell", for: indexPath) as! QuoteCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let screenWidth = self.view.frame.size.width

        return CGSize(width: screenWidth, height: 100.0)
    }
    
}

