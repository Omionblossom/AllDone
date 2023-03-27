//
//  Exercise.swift
//  AllDone01
//
//  Created by 湯川隆臣 on 2023/03/26.
//

import Foundation
import SwiftUI
import FirebaseFirestoreSwift

struct Exercise: Identifiable, Decodable {
    
    @DocumentID var id: String? = UUID().uuidString   // unique to TODO
    var exercise: String
    var date = Date()
    var weight: Double
    var reps: Int
    var ExerciseType: String
    
    func getExerciseType() -> selectedButton {
        if ExerciseType == "Chest" {
            return .chest
        } else if ExerciseType == "Back" {
            return .back
        } else if ExerciseType == "Legs" {
            return .legs
        } else if ExerciseType == "Core" {
            return .core
        } else if ExerciseType == "Shoulder" {
            return .shoulder
        } else if ExerciseType == "Arms" {
            return .arms
        } else if ExerciseType == "Exercize" {
            return .exercize
        } else if ExerciseType == "Run" {
            return .run
        } else {
            return .extra
        }
    }
}
