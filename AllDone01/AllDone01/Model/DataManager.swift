//
//  DataManager.swift
//  AllDone01
//
//  Created by 湯川隆臣 on 2023/03/19.
//

import SwiftUI
import CoreData
import Foundation

/// Full Screen flow
//enum FullScreenMode: Int, Identifiable {
//    case entryCreator, premium, passcodeView, setupPasscodeView
//    var id: Int { hashValue }
//}


/// Main data manager for the app
class DataManager: NSObject, ObservableObject {
    
    /// Dynamic properties that the UI will react to
    @Published var showLoading: Bool = false
//    @Published var fullScreenMode: FullScreenMode?
//    @Published var performance: [String: MoodLevel] = [String: MoodLevel]()
    @Published var selectedDate: Date = Date()
//    @Published var selectedEntryImage: UIImage?
//    @Published var quotes: QuotesList = QuotesList()
//    @Published var didEnterCorrectPasscode: Bool = false
    
    /// Core Data container with the database model
    let container: NSPersistentContainer = NSPersistentContainer(name: "Database")
    
    /// Default init method. Load the Core Data container
    init(preview: Bool = false) {
        super.init()
        if preview {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores { _, _ in
            self.container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        }
//        fetchQuotesData()
    }
    
    /// Calendar days
    var calendarDays: [Date] {
        var days = [Date]()
        for index in 0..<AppConfig.headerTitleDaysCount {
            let date = Calendar(identifier: .gregorian).date(byAdding: .day, value: -index, to: Date())!
            days.append(date)
        }
        days.removeLast()
        days.insert(Calendar(identifier: .gregorian).date(byAdding: .day, value: 1, to: Date())!, at: 0)
        return days.reversed()
    }
    
//    /// Fetch all quotes from local `Quotes` json
//    private func fetchQuotesData() {
//        guard let path = Bundle.main.path(forResource: "Quotes", ofType: "json"),
//              let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe),
//              let models = try? JSONDecoder().decode(QuotesList.self, from: data)
//        else { return }
//        quotes = models.shuffled()
//    }
}
