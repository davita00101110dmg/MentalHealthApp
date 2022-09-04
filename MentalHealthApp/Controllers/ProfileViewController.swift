//
//  ProfileViewController.swift
//  MentalHealthApp
//
//  Created by Dato Khvedelidze on 30.07.22.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestoreSwift


class ProfileViewController: UIViewController {
    
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var profilePictureImage: UIImageView!
    @IBOutlet weak var fullnameLabel: UILabel!
    @IBOutlet weak var yourLikedQuotesLabel: UILabel!
    @IBOutlet weak var collectionViewOutlet: UICollectionView!
     
    var user: User? {
        didSet {
            fullnameLabel.text = "\(user!.firstname) \(user!.lastname)"
            collectionViewOutlet.reloadData()
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchUser()
        setupCollectionView()
        setupElements()

    }
    
    
    //MARK: - Fetch User From DB
    
    private func fetchUser() {
        UserService.fetchUser { user in
            self.user = user
        }
    }
    
    private func setupCollectionView() {
        collectionViewOutlet.delegate = self
        collectionViewOutlet.dataSource = self
        collectionViewOutlet.registerNib(class: QuoteCell.self)
        collectionViewOutlet.layer.cornerRadius = 20
        collectionViewOutlet.backgroundColor = Color.whiteColor
        
        let customFlowLayout = UICollectionViewFlowLayout()
        customFlowLayout.minimumLineSpacing = 10
        customFlowLayout.scrollDirection = .vertical
        collectionViewOutlet.collectionViewLayout = customFlowLayout
    }
    
    private func setupElements() {
        self.view.backgroundColor = Color.lightGreenColor
        
        // Adding system image temprorary
        profilePictureImage.image = UIImage(systemName: "person.crop.circle")
        profilePictureImage.tintColor = .black
        
        // Configuring components of the current view.
        Utilities.customLabel(for: titleLabel, size: 28, text: "Profile")
        Utilities.customLabel(for: fullnameLabel, size: 20, text: String(describing: user?.firstname)) //TODO: Text should be full name variable
        Utilities.customLabel(for: yourLikedQuotesLabel, size: 28, text: "Your liked quotes👇🏻")
        Utilities.customButton(for: logoutButton, title: "Logout", cornerRadius: 10, color: Color.redColor)
    }
    
    @IBAction func logoutAction(_ sender: Any) {

        // Presents bottomsheet with a question if user really wants to sign out
        guard let sheetPresentationController = storyboard?.instantiateViewController(withIdentifier: "BottomSheetViewController") as? BottomSheetViewController else { return }

        present(sheetPresentationController, animated: true)

    }

}

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        user?.liked_quotes.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuoteCell", for: indexPath) as! QuoteCell
        
        let currentQute = user?.liked_quotes[indexPath.row]

        cell.quoteLabel.text = currentQute
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: view.frame.size.width, height: 100.0)
    }
    
}


