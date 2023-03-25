//
//  EmptyListView.swift
//  AllDone01
//
//  Created by 湯川隆臣 on 2023/03/21.
//

import SwiftUI

struct EmptyListView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    @EnvironmentObject var viewModel2: EntryViewModel
    
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "list.star").font(.largeTitle).padding(2)
            Text("No Entries Yet").font(.title3).bold()
            Text("You don't have any entries for today\nTap the 'Check-In' button to add an entry")
                .font(.subheadline).opacity(0.6)
//            Spacer()
            Button {
//                EntryTabView(user: user, viewModel: TODOViewModel(), viewModel2: EntryViewModel())
                // Set up next view to move on
                //manager.fullScreenMode = .entryCreator
            } label: {
                ZStack {
                    Color("BackgroundColor").cornerRadius(10)
                        .frame(width: 200, height: 40)
                        .opacity(0.9)
//                    Color("ListColor").cornerRadius(10) .padding()
                    Text("Check-In").font(.system(size: 14, weight: .semibold))
                        .foregroundColor(Color("ListColor"))
                }.frame(width: 88, height: 42)
            }.padding(.top, 20)
            Spacer()
        }.multilineTextAlignment(.center).foregroundColor(Color("TextColor"))
    }
}

struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyListView()
    }
}
