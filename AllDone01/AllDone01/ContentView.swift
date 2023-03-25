//
//  ContentView.swift
//  AllDone01
//
//  Created by 湯川隆臣 on 2023/03/11.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    @EnvironmentObject var viewModel2: EntryViewModel
    
    var body: some View {
        
        Group {
            if viewModel.userSession == nil {
                LoginView()
            } else {
                if let user = viewModel.currentUser {
//                    MainWindowView()
//                    DashboardView(user: user)
                    TabView {
                        DashboardTestView()
                            .tabItem{
                                Label("Home", systemImage: "house")
                            }
                        DashboardView(user: user)
                            .tabItem{
                                Label("Home", systemImage: "list.bullet.circle")
                            }
                        TabAView()
                            .tabItem{
                                Label("Add", systemImage: "plus.circle")
                            }
                        EntryTabView(user: user, viewModel: TODOViewModel(), viewModel2: EntryViewModel())
                            .tabItem{
                                Label("Goals", systemImage: "list.dash")
                            }
                    }.padding(.bottom, 6)
                }
            }
        }

//        LoginView()
//        ZStack{
//            BackgroundGradientView()
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//        }
//        .padding()
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
    
