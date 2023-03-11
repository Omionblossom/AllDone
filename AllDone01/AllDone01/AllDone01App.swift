//
//  AllDone01App.swift
//  AllDone01
//
//  Created by 湯川隆臣 on 2023/03/11.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}


@main
struct AllDone01App: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    // In Udemy video, init was introduced, but firebase page told to input class AppDelegate, so maybe we don't need init.
    //init() {
      //  FirebaseApp.configure()
    //}
    
    var body: some Scene {
        WindowGroup {
              LoginView()
              //       NavigationView {    // firebase mentioned it with ContentView under NavigationView. Taking note here
                        // ContentView()
//            ContentView()
        }
    }
}
