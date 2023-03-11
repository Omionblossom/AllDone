//
//  LoginView.swift
//  AllDone01
//
//  Created by 湯川隆臣 on 2023/03/11.
//

import SwiftUI

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        
       ZStack{
           BackgroundGradientView()
           
           VStack{
                LogoView()
                   .padding(.bottom, 25)
               
               VStack(spacing: 20){
                   EmailTextField(text: $email)
                       .padding(.horizontal, 32)   // also .leading and .tailing possible
                   
                   
                   
               } // end of VStack
           } // end of VStack
       } // end of ZStack
   }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
