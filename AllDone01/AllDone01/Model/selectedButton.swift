//
//  selectedButton.swift
//  AllDone01
//
//  Created by 湯川隆臣 on 2023/03/11.
//

import Foundation

enum selectedButton: String {
    
    case all = "All"
    case chest = "Chest"
    case back = "Back"
    case legs = "Legs"
    case core = "Core"
    case shoulder = "Shoulder"
    case arms = "Arms"
    case exercize = "Exercize"
    case run = "Run"
    case extra = "Extra"
    
    func getValue() -> String {
        return self.rawValue
        
    }
    
}
