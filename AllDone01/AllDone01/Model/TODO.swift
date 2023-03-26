//
//  TODO.swift
//  AllDone01
//
//  Created by 湯川隆臣 on 2023/03/11.
//

import Foundation
import SwiftUI
import FirebaseFirestoreSwift

struct TODO: Identifiable, Decodable {
    
    @DocumentID var id: String? = UUID().uuidString   // unique to TODO
    let ownerUid: String
    var title: String    // title, description, TODOType can be changed, so it's set as variables i.o. let
    var description: String
    var TODOType: String
    var completed: Bool
    var documentID: String? = ""
    
    func getType() -> selectedButton {
        if TODOType == "Chest" {
            return .chest
        } else if TODOType == "Back" {
            return .back
        } else if TODOType == "Legs" {
            return .legs
        } else if TODOType == "Core" {
            return .core
        } else if TODOType == "Shoulder" {
            return .shoulder
        } else if TODOType == "Arms" {
            return .arms
        } else if TODOType == "Exercise" {
            return .exercize
        } else if TODOType == "Run" {
            return .run
        } else {
            return .extra
        }
    }
    
}
