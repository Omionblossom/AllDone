//
//  PasswordSecureField.swift
//  AllDone01
//
//  Created by 湯川隆臣 on 2023/03/11.
//

import SwiftUI

struct PasswordSecureField: View {
    
    @Binding var text: String
    let placeholder: String
    
    var body: some View {
        CustomSecureField(text: $text, placeholder: Text(placeholder))
            .padding()
            .background(Color(.init(white:1, alpha:0.15)))
            .cornerRadius(10)
            .foregroundColor(.white)
    }
}

struct PasswordSecureField_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            BackgroundGradientView()
            PasswordSecureField(text: .constant(""), placeholder: "Password")
        }
    }
}
