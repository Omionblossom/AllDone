//
//  AddTODOLogo.swift
//  AllDone01
//
//  Created by 湯川隆臣 on 2023/03/13.
//

import SwiftUI

struct AddTODOLogo: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {

        VStack {
            Image("UppperLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .background(colorScheme == .dark ? .clear : .black)
                .cornerRadius(80)
            
            Text("No exercize registered so far!")
                .foregroundColor(colorScheme == .dark ? .white : .black)
                .font(.system(size: 25))
                .fontWeight(.semibold)
            
            Text("Let's try some New!")
                .foregroundColor(colorScheme == .dark ? .white : .black)
                .font(.system(size: 25))
                .fontWeight(.semibold)
        }

    }
}

struct AddTODOLogo_Previews: PreviewProvider {
    static var previews: some View {
        AddTODOLogo()
    }
}
