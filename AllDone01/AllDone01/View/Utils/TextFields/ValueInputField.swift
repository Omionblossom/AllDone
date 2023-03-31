//
//  ValueInputField.swift
//  AllDone01
//
//  Created by 湯川隆臣 on 2023/03/26.
//

import SwiftUI

struct ValueInputField: View {
        
//        @Binding var value: Float
        @State var editNum = 0
//        let placeholder: String
        let imageName: String
        var foregroundColor: Color?   // ? = we might have value or might not have value (optional)
        var body: some View {

//            ZStack(alignment: .leading){
//                if $text.isEmpty {
//                    placeholder
//                        .foregroundColor(foregroundColor ?? Color(.init(white: 1, alpha: 0.8)))
//                        .padding(.leading, 40)
//                }
//
                HStack{
                    Image(systemName: imageName)    //DL SF Symbols
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(foregroundColor ?? .white)

                    
                    TextField("Input", value:$editNum, format:.number)
                    
                }
                
//            }
        }
    }

struct ValueInputField_Previews: PreviewProvider {
    static var previews: some View {
        ValueInputField(imageName: "dumbbell.fill")
    }
}

