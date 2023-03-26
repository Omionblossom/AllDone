//
//  EntryViewModel.swift
//  AllDone01
//
//  Created by 湯川隆臣 on 2023/03/25.
//

import SwiftUI
import Firebase

class EntryViewModel: ObservableObject {
    
    func onTapEntry() {
        guard let user = Auth.auth().currentUser else { return }
        
        let data: [String: Any] = ["exercise": "",
                                   "date": Date(),
                                   "weight": 0.0,
                                   "reps": 0]
        
        COLLECTION_USERS.document(user.uid).collection("records").addDocument(data: data) { error in
            if let error = error {
                print ("DEBUG: \(error.localizedDescription)")
                return
            }
        }
        
    }


//
//    func uploadTODOs(todo: TODO) {
//        guard let user = AuthViewModel.shared.currentUser else { return }
//
//        let data: [String: Any] = ["title": todo.title,
//                                   "description": todo.description,
//                                   "TODOType": todo.TODOType,
//                                   "completed": todo.completed,
//                                   "ownerUID": user.id ?? ""]   // userid optional
//
//        COLLECTION_USERS.document(user.id ?? "").collection("to-dos").addDocument(data: data) { error in
//            if let error = error {
//                print ("DEBUG: \(error.localizedDescription)")
//                return
//            }
//            self.loadTODOs()
//        }
//
//    }
//
//    func deleteTODOs(todoID: String) {
//        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
//
//        COLLECTION_USERS.document(uid).collection("to-dos").document(todoID).delete() { error in
//            if let error = error {
//                print ("DEBUG: \(error.localizedDescription)")
//                return
//            }
//            self.loadTODOs()
//        }
//
//    }
//
//    func completeTODO(todoID: String) {
//        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
//
//        COLLECTION_USERS.document(uid).collection("to-dos").document(todoID).updateData(["completed": true]) { error in
//            if let error = error {
//                print ("DEBUG: \(error.localizedDescription)")
//                return
//            }
//            self.loadTODOs()
//        }
//    }
//
//    func unCompleteTODO(todoID: String) {
//        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
//
//        COLLECTION_USERS.document(uid).collection("to-dos").document(todoID).updateData(["completed": false]) { error in
//            if let error = error {
//                print ("DEBUG: \(error.localizedDescription)")
//                return
//            }
//            self.loadTODOs()
//        }
//    }
//
}
