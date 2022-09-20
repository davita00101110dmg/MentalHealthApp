//
//  UserService.swift
//  MentalHealthApp
//
//  Created by Dato Khvedelidze on 01.09.22.
//

import Firebase

//MARK: - User Service

enum UserService {
    private static let db = Firestore.firestore()
    private static let collectionName = "users"
    private static var firestoreListener: ListenerRegistration?
    
    private static var userUid: String {
        Auth.auth().currentUser?.uid ?? Constant.String.empty
    }
    
    private static var document: DocumentReference {
        db.collection(collectionName).document(userUid)
    }
    
    //MARK: - Registration in Database
    
    static func registerInDB(with name: String, lastname: String, uid: String) {
        document.setData([
            Constant.DocumentField.firstname: name,
            Constant.DocumentField.lastname: lastname,
            Constant.DocumentField.uid: uid,
            Constant.DocumentField.likedQuotes: []
        ])
    }
    
    //MARK: - Fetch User
    
    static func fetchUser(detach: Bool, completion: ((User) -> Void)?) {
        firestoreListener?.remove()
        
        if !detach {
            firestoreListener = document.addSnapshotListener { documentSnapshot, error in
                guard let document = documentSnapshot else { return }
                let createdUser = User(snapshot: document)
                completion!(createdUser)
            }
        }
    }
    
    //MARK: - Update liked quotes array
    
    static func updateLikedQuotesArray(clikedLike: Bool, quote: String) {
        switch clikedLike {
        case true:
            document.updateData([
                Constant.DocumentField.likedQuotes: FieldValue.arrayRemove([quote])
            ])
            
        case false:
            document.updateData([
                Constant.DocumentField.likedQuotes: FieldValue.arrayUnion([quote])
            ])
        }
    }
}
