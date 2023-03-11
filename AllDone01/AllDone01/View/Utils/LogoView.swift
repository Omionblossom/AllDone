//
//  LogoView.swift
//  AllDone01
//
//  Created by 湯川隆臣 on 2023/03/11.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        VStack {
            Image("UppperLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height:150)
            Text("AllDone")
                .foregroundColor(.white)
                .font(.system(size: 25))
                .fontWeight(.semibold)
        }
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundGradientView()
            LogoView()
        }
    }
}
