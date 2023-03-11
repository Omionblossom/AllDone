//
//  DashboardView.swift
//  AllDone01
//
//  Created by 湯川隆臣 on 2023/03/12.
//

import SwiftUI

struct DashboardView: View {
    
    let user: AppUser

    
    var body: some View {
        VStack {
            Text("DashboardView")
            Button {
                AuthViewModel.shared.signout()
            } label: {
                Text("Log Out")
            }
            .padding()
            

        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(user: appUser01 )
    }
}
