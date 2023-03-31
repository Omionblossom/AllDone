//
//  HomeTabViewModel.swift
//  AllDone01
//
//  Created by 湯川隆臣 on 2023/03/29.
//

import Foundation
import Firebase

class HomeTabViewModel: ObservableObject {
    
    struct State {
        var exercises: [Exercise]
        var calendarDays: [Date]
        var selectedDate: Date?
        var today = Date()
        
    }
    
    //    @Published var state: State = State(exercises: [.init(id: "id1", exercise: "ShoulderPress", date: Date(), weight: 55, reps: 18, exerciseType: "shoulder"), .init(id: "id2", exercise: "DumbelRow", date: Date(), weight: 20, reps: 14, exerciseType: "back")])  // sample
    
    @Published var state: State = State(exercises: [], calendarDays: [])  // プロパティ名は小文字

    let data: [String: Any ] = [
        "exercise": "",
        "date": Date(),
        "weight": 0.0,
        "reps": 0
    ]
    
    func onAppear () {
        let day = Date()
        state.selectedDate = Date()
        state.calendarDays = [
                              Calendar.current.date(byAdding: .day, value:-7, to:day
                                                   )!,
                              Calendar.current.date(byAdding: .day, value:-6, to:day
                                                   )!,
                              Calendar.current.date(byAdding: .day, value:-5, to:day
                                                   )!,
                              Calendar.current.date(byAdding: .day, value:-4, to:day
                                                   )!,
                              Calendar.current.date(byAdding: .day, value:-3, to:day
                                                   )!,
                              Calendar.current.date(byAdding: .day, value:-2, to:day
                                                   )!,
                              Calendar.current.date(byAdding: .day, value:-1, to:day
                                                   )!,
                              Date(),
                              Calendar.current.date(byAdding: .day, value:1, to:day
                                                   )!
        ]
        if let date = state.selectedDate {
            updateExercises (date: date)
        }
    }
    
    func updateExercises (date: Date) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        
//        let query = COLLECTION_USERS.document(user.uid).collection("records").order(by: "exercise", descending: false)
        let start = Calendar.current.startOfDay(for: date)
        let end = Calendar.current.date(byAdding: .day, value: 1, to: start)
        let query = COLLECTION_USERS.document(user.uid).collection("records").order(by: "date", descending: false).start(at: [start]).end(at: [end])
        
        
        query.getDocuments { snapshot, _ in
            
            guard let documents = snapshot?.documents else { return }
            print(documents)
            
            self.state.exercises = documents.compactMap ({ document -> Exercise? in
              
                guard let exercise = document.data()["exercise"] as? String,
                let date = document.data()["date"] as? Timestamp,
                let weight = document.data()["weight"] as? Double,
                let reps = document.data()["reps"] as? Int
                else {
                    return nil
                }
                return Exercise (id: document.documentID, exercise: exercise, date: date.dateValue(), weight: weight, reps: reps)
            })
            
            //            state.exercises = documents
            
            
            //                    state.exercises = [.init(id: "id1", exercise: "ShoulderPress", date: Date(), weight: 55, reps: 18, exerciseType: "shoulder"), .init(id: "id2", exercise: "DumbelRow", date: Date(), weight: 20, reps: 14, exerciseType: "back")]
        }
    }
    
    func onTapCalendar (date: Date) {
        state.selectedDate = date
        if let date = state.selectedDate {
            updateExercises (date: date)
        }
//            var date = state.selectedDate
    }
    
    
}


