//
//  AuthViewModel.swift
//  AllDone01
//
//  Created by 湯川隆臣 on 2023/03/12.
//

import SwiftUI
import Firebase
import FirebaseAuth

class AuthViewModel: ObservableObject {
    
    @Published var userSession: User?  // Firebase user
    @Published var currentUser: AppUser? // current user
    
    static let shared = AuthViewModel()
    
    init() {
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func fetchUser() {
        guard let uid = userSession?.uid else { return }
        COLLECTION_USERS.document(uid).getDocument { snapshot, _ in
            guard let user = try? snapshot?.data(as: AppUser.self) else { return }
            self.currentUser = user
            
        }
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) {result, error in
            if let error = error {
                print("DEBUG: Login Failed \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            self.fetchUser()
            
        }
    }
    
    func regiser(withEmail email: String, password: String, firstName: String, lastName: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Register Failed \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            
            let data = ["uid": user.uid,
                        "firstName": firstName,
                        "lastName": lastName,
                        "email": email,
                        //"records": records // ここにSubcollectionを指定して、.setDataしたら出来るかと思って見ましたが先に進めません
            ]
            
            COLLECTION_USERS.document(user.uid).setData(data) { _ in
                print("Successfully uploaded data")
                self.userSession = user
                self.fetchUser()
            }
        }
    }
    
    func signout() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    func resetPassword() {
        // not covered in video. Need to figure out by myself. 
    }
    
}
