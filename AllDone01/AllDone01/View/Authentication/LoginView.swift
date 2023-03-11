//
//  LoginView.swift
//  AllDone01
//
//  Created by 湯川隆臣 on 2023/03/11.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        
       ZStack{
           BackgroundGradientView()
           
           VStack{
                LogoView()
           }
       }
   }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
