//
//  DashboardView.swift
//  AllDone01
//
//  Created by 湯川隆臣 on 2023/03/12.
//

import SwiftUI

struct DashboardView: View {
    
    let user: AppUser
    
    @State var searchText: String = ""

    @ObservedObject var viewModel = TODOViewModel()
    
    var body: some View {
        
        ZStack {
            
            VStack{
                HStack {
                    Spacer()
                    Text("- AllDone -")
                        .font(.system(size: 24))
                        .fontWeight(.semibold)
                    Spacer()
                } // end of HStack
                .overlay {
                    HStack {
                        Spacer()
                        Button {
                            AuthViewModel.shared.signout()
                        } label: {
                            Text("Logout")
                                .foregroundColor(Color(.systemGray))
                        }
                        .padding(.trailing)
                    }
                } // end of HStack overlay
                
                SearchBarView(searchText: $searchText)
                    .padding()
                
                
            } // end of VStack
            
        } // end of Zstack
        
//        VStack {
//            Text("DashboardView")
//            Button {
//                AuthViewModel.shared.signout()
//            } label: {
//                Text("Log Out")
//            }
//            .padding()
//
//
//        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(user: appUser01 )
    }
}
