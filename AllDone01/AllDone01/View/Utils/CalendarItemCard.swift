//
//  CalendarItemView.swift
//  AllDone01
//
//  Created by 湯川隆臣 on 2023/03/22.
//

import SwiftUI

struct CalendarItemCard: View {
    
    var isTodayItem: Bool
    var isSelectedItem: Bool
    var date: Date
    
    var body: some View {
        VStack(spacing: 2) {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: 44, height: 39, alignment: .center)
                    .foregroundColor(Color("BackgroundColor"))
                    .opacity(isTodayItem ? 1 : (isSelectedItem ? 0.65 : 0.1))
                Text(date.string(format: "d")).font(.system(size: 22, weight: .semibold))
                    .foregroundColor(isTodayItem || isSelectedItem ? Color("LightColor") : Color("Primary"))
            }
            Text(date.string(format: "E")).font(.system(size: 12))
                .foregroundColor(Color("Primary"))
        }.padding(5).background(Color("LightColor").cornerRadius(10))
    }
}

struct CalendarItemCard_Previews: PreviewProvider {
    static var previews: some View {
        CalendarItemCard(isTodayItem: false, isSelectedItem: true, date: Date())
    }
}
