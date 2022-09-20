//
//  User.swift
//  MentalHealthApp
//
//  Created by Dato Khvedelidze on 15.08.22.
//

import Firebase
import FirebaseFirestore

// MARK: - User

struct User: Decodable {
    let firstname: String
    let lastname: String
    let uid: String
    let liked_quotes: [String]
    
    init(snapshot: DocumentSnapshot) {
        let snapshotValue = snapshot.data()
        firstname = snapshotValue?[Constant.DocumentField.firstname] as? String ?? Constant.String.empty
        lastname = snapshotValue?[Constant.DocumentField.lastname] as? String ?? Constant.String.empty
        uid = snapshotValue?[Constant.DocumentField.uid] as? String ?? Constant.String.empty
        liked_quotes = snapshotValue?[Constant.DocumentField.likedQuotes] as? [String] ?? [Constant.String.empty]
    }
}
