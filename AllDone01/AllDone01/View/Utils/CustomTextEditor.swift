//
//  CustomTextEditor.swift
//  AllDone01
//
//  Created by 湯川隆臣 on 2023/03/15.
//

import SwiftUI

struct CustomTextEditor: View {
    
    @Binding var text:String
    let placeholder: Text
    let imageName: String
    var foregroundColor: Color?   // ? = we might have value or might not have value (optional)
    
    @Environment(\.colorScheme) var colorScheme
    
    init(text: Binding<String>, placeholder: Text, imageName: String,
         foregroundColor: Color?) {
        self._text = text
        self.placeholder = placeholder
        self.imageName = imageName
        if let safeForegroundColor = foregroundColor {
            self.foregroundColor = safeForegroundColor
        }
        UITextView.appearance().backgroundColor = .clear
    }
    
    
    var body: some View {
        
        ZStack(alignment: .leading){
            VStack{
                HStack{
                    if text.isEmpty {
                        placeholder
                            .foregroundColor(foregroundColor ?? Color(.init(white: 1, alpha: 0.8)))
                            .padding(.leading, 40)
                    }
                    Spacer()
                }
                .padding([.vertical], 10)
                Spacer()
            }
            
            HStack{
                Image(systemName: imageName)    //DL SF Symbols
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(foregroundColor ?? .white)
                    .padding([.vertical], 10)
                    .padding(.leading, 15)
                Spacer()
            }
            TextEditor(text: $text)
                .autocapitalization(.none)
            
        }
        .frame(height: 120)
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .foregroundColor(colorScheme == .dark ? .white : .black)
    }
}


struct CustomTextEditor_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            CustomTextEditor(text: .constant(""), placeholder: Text("Description"), imageName: "line.3.horizontal", foregroundColor: .gray)
        }
        
        

    }
}
