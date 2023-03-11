//
//  AppUser.swift
//  AllDone01
//
//  Created by 湯川隆臣 on 2023/03/11.
//

import FirebaseFirestoreSwift

struct AppUser: Identifiable, Decodable {
    
    @DocumentID var id: String?   // unique key
    let uid: String
    let firstName: String
    let lastName: String
    let email: String
    
    var isCurrentUser: Bool {
        return AuthViewModel.shared.userSession?.uid == id
        
        
    }
    
    
    
}
