//
//  SignupView.swift
//  AllDone01
//
//  Created by 湯川隆臣 on 2023/03/11.
//

import SwiftUI

struct SignupView: View {
    
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    
    @Environment(\.presentationMode) var mode
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
 
        ZStack{
            BackgroundGradientView()
            
            VStack {
                LogoView()
                    .padding(.bottom,25)
                
                VStack(spacing: 20) {
                    
                    UserTextField(text: $firstName, placeholder: "First Name")
                    UserTextField(text: $lastName, placeholder: "Last Name")
                    EmailTextField(text: $email)
                    PasswordSecureField(text: $password, placeholder: "Password")
                    PasswordSecureField(text: $confirmPassword, placeholder: "Confirm Password")
                    
                } // end of VStack
                .padding(.horizontal, 32)
                
                Button {
                    // Sign up Action
                    viewModel.regiser(withEmail: email, password: password, firstName: firstName, lastName: lastName)
                } label: {
                    AuthenticateButtonView(text: "Sign Up")
                        .padding()
                    
                }
                Spacer()
                
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    HStack{
                        Text("Already have an account?")
                            .font(.system(size: 14))
                        Text("Sign In")
                            .font(.system(size: 14, weight: .semibold))
                    }
                    .foregroundColor(.gray)
                }
                .padding(.bottom, 16)

                
            }// end of VStack
            .padding(.top, 20)
            
        } // end of ZStack
    }
}

//HStack  horizontal stack
//VStack  vertical
//ZStack  top of each other

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
