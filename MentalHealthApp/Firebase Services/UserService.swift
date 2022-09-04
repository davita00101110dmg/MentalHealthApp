//
//  UserService.swift
//  MentalHealthApp
//
//  Created by Dato Khvedelidze on 01.09.22.
//

import Firebase
import FirebaseFirestore
import FirebaseAuth
import UIKit

//MARK: - User Service

enum UserService {
    
    private static let db = Firestore.firestore()
    private static let collectionName = "users"
    
    private static var userUid: String {
        Auth.auth().currentUser?.uid ?? ""
    }
    private static var document: DocumentReference {
        db.collection(collectionName).document(userUid)
    }
    
    //MARK: - Registration in database
    
    static func registerInDB(with name: String, lastname: String, uid: String) {
        
        document.setData([
            "firstname": name,
            "lastname": lastname,
            "uid": uid,
            "liked_quotes": []
        ])
    }
    
    //MARK: - Fetch User
    
    static func fetchUser(completion: @escaping (User) -> Void) {
        
        document.addSnapshotListener { documentSnapshot, error in
            guard let document = documentSnapshot else {
                print("Error fetching document: \(error!)")
                return
            }
            
            let createdUser = User(snapshot: document)
            
            completion(createdUser)
        }
        
    }
    
    //MARK: - Update liked quotes array
    
    static func updateLikedQuotesArray(condition: Bool, quote: String) {
        
        switch condition {
        case true:
            document.updateData([
                "liked_quotes": FieldValue.arrayRemove([quote])
            ])
            
        case false:
            document.updateData([
                "liked_quotes": FieldValue.arrayUnion([quote])
            ])
        }
    }
    
}
