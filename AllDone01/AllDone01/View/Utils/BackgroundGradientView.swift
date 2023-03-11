//
//  BackgroundGradientView.swift
//  AllDone01
//
//  Created by 湯川隆臣 on 2023/03/11.
//

import SwiftUI

struct BackgroundGradientView: View {
    var body: some View {

        LinearGradient(gradient: Gradient(colors: [Color.gray, Color.white.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
    }
}

struct BackgroundGradientView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundGradientView()
    }
}
