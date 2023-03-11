//
//  CustomSecureField.swift
//  AllDone01
//
//  Created by 湯川隆臣 on 2023/03/11.
//

import SwiftUI

struct CustomSecureField: View {
    
    @Binding var text: String
    let placeholder: Text
    
    var body: some View {

        ZStack(alignment:.leading){
            if text.isEmpty{
                placeholder
                    .foregroundColor(Color(.init(white: 1, alpha: 0.8)))
                    .padding(.leading, 40)
            }
            
            HStack {
                Image(systemName: "lock")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                
                SecureField("", text: $text)
                    .autocapitalization(.none)
            }
            
        } // end of ZStack
        
    }
}

struct CustomSecureField_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            BackgroundGradientView()
            CustomSecureField(text: .constant(""), placeholder: Text("Password") )

        }
    }
}
