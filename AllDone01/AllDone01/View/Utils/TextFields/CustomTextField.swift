//
//  CustomTextField.swift
//  AllDone01
//
//  Created by 湯川隆臣 on 2023/03/11.
//

import SwiftUI

struct CustomTextField: View {
    
    @Binding var text:String
    let placeholder: Text
    let imageName: String
    var foregroundColor: Color?   // ? = we might have value or might not have value (optional)

    var body: some View {

        ZStack(alignment: .leading){
            if text.isEmpty {
                placeholder
                    .foregroundColor(foregroundColor ?? Color(.init(white: 1, alpha: 0.8)))
                    .padding(.leading, 40)
            }
            
            HStack{
                Image(systemName: imageName)    //DL SF Symbols
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(foregroundColor ?? .white)
                
                TextField("", text: $text)
                    .autocapitalization(.none)
            }
            
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
                CustomTextField(text: .constant(""), placeholder: Text("Email"), imageName: "envelope")
        }
        
        

    }
}
