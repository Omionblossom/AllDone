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
                   PasswordSecureField(text: $password, placeholder: "Password")
               } // end of VStack
               .padding(.horizontal, 32)   // also .leading and .tailing possible. Add to VStack
          
               HStack {
                   Spacer()  // filling up the space
                   
                   Button {
                       // forgot password action
                   } label: {
                       Text("Forgot Password")
                           .foregroundColor(.white)
                           .font(.system(size: 13, weight: .semibold))
                           .padding(.top)
                           .padding(.trailing, 28)
                   }
               } // end of HStack
 
               Button {
                   // sign in Action
                   
               } label: {
                   AuthenticateButtonView(text: "Sign In ")
                       .padding()
               }


               Spacer()
               
               
           } // end of VStack
       } // end of ZStack
   }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
