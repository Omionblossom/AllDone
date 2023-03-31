//
//  ShowRecordsViewModel.swift
//  AllDone01
//
//  Created by 湯川隆臣 on 2023/03/26.
//

import SwiftUI
import Firebase

class ShowRecordsViewModel: ObservableObject {
    
//    @Published var records = [Exercise]()

//    @Published var recordsFiltered = [TODO]()

//        init(){
//            loadRecords()
//        }
//
    //    init(){
    //        loadTODOs()
    //    }
    
    struct State {
        var exercises: [Exercise]

    }
    
    @Published var state: State = State(exercises: [])  // プロパティ名は小文字

    
    let data: [String: Any ] = [
        "exercise": "",
        "date": Date(),
        "weight": 0.0,
        "reps": 0
    ]
    
    func loadRecords() {
//        guard Auth.auth().currentUser != nil else { return }
        guard let user = Auth.auth().currentUser else { return }
        
        let query = COLLECTION_USERS.document(user.uid).collection("records").order(by: "exercise", descending: false)
        
        query.getDocuments { snapshot, _ in
            
            guard let documents = snapshot?.documents else { return }
            print("☀️")
            
        }
        
        
//        query.getDocuments { snapshot, _ in
//            guard let documents = snapshot?.documents else { return }
//            self.records = documents.compactMap({try? $0.data(as: Exercise.self) })
//
//            for index in stride(from: 0, to: self.records.count, by: 1) {
//                self.records[index].documentID = documents[index].documentID
//            }
//            self.todosFiltered = self.todos
//
//            self.todosFiltered = self.todos
//        }
    }
}
