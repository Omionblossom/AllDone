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
        
        let data: [String: Any] = ["exercise": state.exercise.uppercased(),
                                   "date": Date(),
                                   "weight": state.weight,
                                   "reps": state.reps]
        
        COLLECTION_USERS.document(user.uid).collection("records").addDocument(data: data) { error in
            if let error = error {
                print ("DEBUG: \(error.localizedDescription)")
                return
            }
        }
        
    }
    
    @Published var showExerciseEntryView: Bool = false   // pop up control
    @Published var state: State = State(weight: 20, reps: 10, exercise: "")  // プロパティ名は小文字
    
    func onInputWeight(_ weight: String) {
        guard let weight = Double(weight) else { return }
        state.weight = weight
    }
    
    func onInputReps(_ reps: String) {
        guard let reps = Int(reps) else { return }
        state.reps = reps
    }

    func onInputExercise(_ exercise: String) {
        state.exercise = exercise
    }
    
    struct State {
        var weight: Double
        var reps: Int
        var exercise: String
            
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
