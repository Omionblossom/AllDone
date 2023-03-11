//
//  EmailTextField.swift
//  AllDone01
//
//  Created by 湯川隆臣 on 2023/03/11.
//

import SwiftUI

struct EmailTextField: View {
    
    @Binding var text: String
    
    var body: some View {
            CustomTextField(text: $text, placeholder: Text("Email"), imageName:"envelope")
                .padding()
                .background(Color(.init(white: 1, alpha: 0.15)))   //alpha is transparency degree
                .cornerRadius(10)
                .foregroundColor(.white)
    }
}

struct EmailTextField_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            BackgroundGradientView()
            EmailTextField(text: .constant("Email"))
        }
        //EmailTextField(text: .constant("Email"))
    }
}
