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
    @State var forgotPW: Bool = false
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        NavigationView {
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
                           forgotPW = true
                       } label: {
                           Text("Forgot Password")
                               .foregroundColor(.white)
                               .font(.system(size: 13, weight: .semibold))
                               .padding(.top)
                               .padding(.trailing, 28)
                       }.alert(isPresented: $forgotPW, content: {
                           Alert(title: Text("Please contact Admin Mgr"))
                       })
                   } // end of HStack
     
                   Button {
                       // sign in Action
                       viewModel.login(withEmail: email, password: password)
                   } label: {
                       AuthenticateButtonView(text: "Sign In ")
                           .padding()
                   }


                   Spacer()
                   
                   NavigationLink(
                    destination: SignupView()
                        .navigationBarHidden(true),
                    label: {
                        HStack {
                            Text("Don't have an account?")
                                .font(.system(size: 14))
                            Text("Sign Up")
                                .font(.system(size: 14, weight: .semibold))
                        }
                        .foregroundColor(.black)
                    }
                   )
                   .padding(.bottom, 16)
                
               } // end of VStack
               .padding(.top, 40)
            }
        } // end of ZStack
   }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
