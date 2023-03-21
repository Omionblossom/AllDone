//
//  CheckInBannerView.swift
//  AllDone01
//
//  Created by 湯川隆臣 on 2023/03/21.
//

import SwiftUI

struct CheckInBannerView: View {
    var body: some View {
//        let isPastDate = Date() > manager.selectedDate
    ZStack{
            Color("BackgroundColor").cornerRadius(16)
            HStack {
                VStack(alignment: .leading) {
                    Text("Daily Records")
                        .font(.system(size: 20, weight: .semibold))
                    Text("How is your day so far?")
//                    Text(disableCheckIn ? "Oops!" : "Daily Check-In").font(.system(size: 20, weight: .semibold))
//                    Text(disableCheckIn ? "\(isPastDate ? "Past" : "Future") Check-In is disabled" : "How is your day so far?")
                }.foregroundColor(Color("LightColor"))
                Spacer()
                Button {
                    // Set up next view to move on
                    //manager.fullScreenMode = .entryCreator
                } label: {
                    ZStack {
                        Color("LightColor").cornerRadius(10)
                        Text("Check-In").font(.system(size: 14, weight: .semibold))
                            .foregroundColor(Color("BackgroundColor"))
                    }
                }.frame(width: 88, height: 42) //.disabled(disableCheckIn)
            }.padding()
        }
        .frame(height: 72).padding([.horizontal, .bottom])
//        .opacity(disableCheckIn ? 0.8 : 1)
    }
}


struct CheckInBannerView_Previews: PreviewProvider {
    static var previews: some View {
        CheckInBannerView()
    }
}
