//
//  ProfileViewController.swift
//  MentalHealthApp
//
//  Created by Dato Khvedelidze on 30.07.22.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var profilePictureImage: UIImageView!
    @IBOutlet weak var fullnameLabel: UILabel!
    @IBOutlet weak var yourLikedQuotesLabel: UILabel!
    @IBOutlet weak var collectionViewOutlet: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        setupElements()
    }
    
    private func setupCollectionView() {
        collectionViewOutlet.delegate = self
        collectionViewOutlet.dataSource = self
        collectionViewOutlet.registerNib(class: QuoteCell.self)
        collectionViewOutlet.layer.cornerRadius = 20
        collectionViewOutlet.backgroundColor = whiteColor
        
        let customFlowLayout = UICollectionViewFlowLayout()
        customFlowLayout.minimumLineSpacing = 10
        customFlowLayout.scrollDirection = .vertical
        collectionViewOutlet.collectionViewLayout = customFlowLayout
    }
    
    private func setupElements() {
        self.view.backgroundColor = lightGreenColor
        
        // Adding system image temprorary
        profilePictureImage.image = UIImage(systemName: "person.crop.circle")
        profilePictureImage.tintColor = .black
        
        // Configuring components of the current view.
        Utilities.customLabel(for: titleLabel, size: 28, text: "Profile")
        Utilities.customLabel(for: fullnameLabel, size: 20, text: "Dato Khvedelidze") //TODO: Text should be full name variable
        Utilities.customLabel(for: yourLikedQuotesLabel, size: 28, text: "Your liked quotes👇🏻")
        Utilities.customButton(for: logoutButton, title: "Logout", cornerRadius: 10, color: redColor)
    }
    
    @IBAction func logoutAction(_ sender: Any) {

        // Presents bottomsheet with a question if user really wants to sign out
        guard let sheetPresentationController = storyboard?.instantiateViewController(withIdentifier: "BottomSheetViewController") as? BottomSheetViewController else { return }

        present(sheetPresentationController, animated: true)

    }

}
