//
//  HeaderCalendarView.swift
//  AllDone01
//
//  Created by 湯川隆臣 on 2023/03/22.
//

import SwiftUI

struct HeaderCalendarView: View {
    
    var days: [Date]
    var selectedDate: Date?
    var onTapGesture: (Date) -> Void
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ScrollViewReader { proxy in
                HStack(spacing: 15) {
                    Spacer(minLength: 0)
                    ForEach(days, id: \.self) { date in
                        CalendarItemCard(isTodayItem: date.longFormat == Date().longFormat, isSelectedItem: date.longFormat == selectedDate?.longFormat, date: date).id(date).onTapGesture {
                            onTapGesture(date)
                        }
                    }
                    Spacer(minLength: 0)
                }.onAppear {
                    proxy.scrollTo(days.count-1)
                }
            }
        }
    }
}

struct HeaderCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        let day = Date()
        let days: [Date] = [
            Calendar.current.date(byAdding: .day, value:1, to:day
                                 )!,
            Calendar.current.date(byAdding: .day, value:2, to:day
                                 )!,
            Calendar.current.date(byAdding: .day, value:3, to:day
                                 )!,
            Calendar.current.date(byAdding: .day, value:4, to:day
                                 )!,
            Calendar.current.date(byAdding: .day, value:5, to:day
                                 )!,
            Calendar.current.date(byAdding: .day, value:6, to:day
                                 )!,
            Calendar.current.date(byAdding: .day, value:7, to:day
                                 )!,
            Calendar.current.date(byAdding: .day, value:8, to:day
                                 )!,
        ]
        HeaderCalendarView(days: days, selectedDate:Date(), onTapGesture: {
            _ in
        } )
    }
}
