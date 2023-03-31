//
//  AppConfig.swift
//  DailyJournal
//
//  Created by Apps4World on 6/5/22.
//

import SwiftUI
import Foundation

/// Generic configurations for the app
class AppConfig {
        
    // MARK: - Settings flow items  // future use
//    static let privacyURL: URL = URL(string: "https://www.google.com/")!
//    static let termsAndConditionsURL: URL = URL(string: "https://www.google.com/")!
//    static let yourAppURL: URL = URL(string: "https://apps.apple.com/app/idXXXXXXXXX")!
    
    // MARK: - Generic configurations
    static let headerTitleDaysCount: Int = 10
}

// MARK: - Mood Level Configurations
enum MoodLevel: Int, CaseIterable, Identifiable {
    case level1 = 1, level2, level3, level4, level5
    var id: Int { hashValue }
    
    /// Mood text options  // use it for Frequently used exercise names
    var moodOptions: [String] {
        switch self {
        case .level1:  // chest
            return ["Bench Press", "Inclined Bench Press", "Dumbbel fly", "Inclined Dumbbel fly", "wire fly", "push ups"]
        case .level2:  // back
            return ["Chinning", "Supported Chinning", "Lat Pull Down", "Dead Lift", "Hex bar Dead Lift", "Dumbbel Rowing", "Cable Rowing", "One-sided Dumbbel Rowing"]
        case .level3:  // legs
            return ["Squat", "Sqaut own weight", "Front Lunge", "Dumbbel Back Lunge", "Leg Press", "Leg Curl"]
        case .level4:  // shoulders and arms
            return ["Shoulder Fly", "Shoulder Press", "Shoulder Dumbbel Press", "Front Deltoid Raise", "Back Deltoid Raise", "Cable shoulder fly", "One-handed Shoulder Fly"]
        case .level5:  // others
            return ["Regular Crunch", "Bycicle Crunch", "Toe Touch", "Toe Touch Cross", "Russian Twist", "Plank", "Burpee"]
        }
    }
    
    /// Mood chart percentage
    var chartValue: CGFloat {
        switch self {
        case .level1: return 15
        case .level2: return 25
        case .level3: return 50
        case .level4: return 75
        case .level5: return 95
        }
    }
    
    /// Mood chart color
    var chartColor: Color {
        switch self {
        case .level1: return [Color(#colorLiteral(red: 0.9837132096, green: 0.4513888955, blue: 0.4547883272, alpha: 1))][0]
        case .level2: return [Color(#colorLiteral(red: 0.9979071021, green: 0.6928624511, blue: 0.4608915448, alpha: 1))][0]
        case .level3: return [Color(#colorLiteral(red: 0.7912710309, green: 0.7962428927, blue: 0.7918474674, alpha: 1))][0]
        case .level4: return [Color(#colorLiteral(red: 0.4645724893, green: 0.8924402595, blue: 0.8699511886, alpha: 1))][0]
        case .level5: return [Color(#colorLiteral(red: 0.3809461594, green: 0.6858740449, blue: 1, alpha: 1))][0]
        }
    }
}

// MARK: - Mood Reasons
enum MoodReason: String, CaseIterable, Identifiable {
    case work, friends, nature, pets, fitness, travel, gaming, shopping
    var id: Int { hashValue }
}
