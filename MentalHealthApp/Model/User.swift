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
        firstname = snapshotValue?["firstname"] as? String ?? "No name"
        lastname = snapshotValue?["lastname"] as? String ?? "No lastname"
        uid = snapshotValue?["uid"] as? String ?? "No uid"
        liked_quotes = snapshotValue?["liked_quotes"] as? [String] ?? ["Empty"]
    }
}
