//
//  AuthenticateButtonView.swift
//  AllDone01
//
//  Created by 湯川隆臣 on 2023/03/11.
//

import SwiftUI

struct AuthenticateButtonView: View {
    
    let text: String
    
    var body: some View {
        Text(text)
            .font(.headline)
            .foregroundColor(.white)
            .frame(width: 360, height: 50)
            .background(Color.gray.opacity(0.6))
            .clipShape(Capsule())
    }
}

struct AuthenticateButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticateButtonView(text: "Sign In")
    }
}
