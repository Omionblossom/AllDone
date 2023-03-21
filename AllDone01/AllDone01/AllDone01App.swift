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
//              LoginView()
            ContentView()
                .environmentObject(AuthViewModel.shared)
              //       NavigationView {    // firebase mentioned it with ContentView under NavigationView. Taking note here
                        // ContentView()
        }
    }
}

/// Create a shape with specific rounded corners
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
