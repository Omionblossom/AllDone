//
//  TODOTextField.swift
//  AllDone01
//
//  Created by 湯川隆臣 on 2023/03/15.
//

import SwiftUI

struct TODOTextField: View {
    
    @Binding var text: String
    let placeholder: String
    
    var body: some View {
        CustomTextField(text: $text, placeholder: Text(placeholder), imageName: "checkmark", foregroundColor: .gray)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
    }
}

struct TODOTextField_Previews: PreviewProvider {
    static var previews: some View {
        TODOTextField(text: .constant(""), placeholder: "Title")
    }
}
