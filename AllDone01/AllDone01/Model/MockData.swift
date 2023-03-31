//
//  MockData.swift
//  AllDone01
//
//  Created by 湯川隆臣 on 2023/03/12.
//

import Foundation

let appUser01 = AppUser(id: "1", uid: "1", firstName: "John", lastName: "Parker", email: "johnparker@gmail.com")

let todo01 = TODO(id: "1", ownerUid: "1", title: "tomatoes", description: "Must be from Publix", TODOType: "Chest", completed: false)
let todo02 = TODO(id: "2", ownerUid: "2", title: "meat", description: "Clean meat", TODOType: "Chest", completed: true)
let todo03 = TODO(id: "3", ownerUid: "3", title: "Do homework", description: "", TODOType: "Legs", completed: false)

let exercise01 = Exercise(id:"id", exercise: "Benchpress", date: Date(), weight: 100, reps: 5, exerciseType: "chest")
