//
//  HeaderTitle.swift
//  AllDone01
//
//  Created by 湯川隆臣 on 2023/03/24.
//

import SwiftUI


struct HeaderTitle: View {
    
    var selectedDate: Date
    var selectedTab: String
    /// Custom header title for each tab
    var headerTitle: String {
        switch self {
        case .home: return "Daily Journal"
        case .stats: return "Fun Statistics"
        case .quotes: return "Get Inspired"
        case .settings: return "Settings"
        }
    }
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(selectedDate.headerTitle)
                Text(selectedTab.headerTitle).font(.largeTitle).bold()
            }
            Spacer()
        }.padding(.horizontal).foregroundColor(Color("LightColor"))
    }
    
    struct HeaderTitle_Previews: PreviewProvider {
        static var previews: some View {
            HeaderTitle(selectedDate: Date(), selectedTab: "Daily Journal")
        }
    }
}
