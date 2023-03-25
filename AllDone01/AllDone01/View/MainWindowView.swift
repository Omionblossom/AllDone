//
//  MainWindowView.swift
//  AllDone01
//
//  Created by 湯川隆臣 on 2023/03/25.
//

import SwiftUI

struct MainWindowView: View {
    var body: some View {
        TabView {
            HomeTabView()
                .tabItem{
                    Label("Home", systemImage: "house")
                }
            TabAView()
                .tabItem{
                    Label("Add", systemImage: "plus.circle")
                }
            TabBView()
                .tabItem{
                    Label("Detail", systemImage: "list.dash")
                }
        }.padding(.bottom, 6)
    }
}

struct MainWindowView_Previews: PreviewProvider {
    static var previews: some View {
        MainWindowView()
    }
}
