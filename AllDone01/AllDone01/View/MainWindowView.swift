//
//  MainWindowView.swift
//  AllDone01
//
//  Created by 湯川隆臣 on 2023/03/25.
//

import SwiftUI

struct MainWindowView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
            TabView {
                DashboardTestView()
                    .tabItem{
                        Label("Home", systemImage: "house")
                    }
                TabAView()
                    .tabItem{
                        Label("Add", systemImage: "plus.circle")
                    }
                TabBView()
                    .tabItem{
                        Label("Goals", systemImage: "list.dash")
                    }
            }.padding(.bottom, 6)
    }
}

struct MainWindowView_Previews: PreviewProvider {
    static var previews: some View {
        MainWindowView()
    }
}
