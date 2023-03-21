//
//  BackgroundGradientView.swift
//  AllDone01
//
//  Created by 湯川隆臣 on 2023/03/11.
//

import SwiftUI

struct BackgroundGradientView: View {
    var body: some View {

        // testing stylish colorful grading
        LinearGradient(gradient: Gradient(colors: [Color.pink, Color.purple
            .opacity(0.6)]), startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()

//        LinearGradient(gradient: Gradient(colors: [Color.gray,    Color.white.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
//            .ignoresSafeArea()
//  Original gray gradient background (Cool)
    }
}

struct BackgroundGradientView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundGradientView()
    }
}
