//
//  DashboardTestView.swift
//  AllDone01
//
//  Created by 湯川隆臣 on 2023/03/19.
//

import SwiftUI

//// MARK: - Custom tab bar items
//enum CustomTabBarItem: String, Identifiable, CaseIterable {
//    case home = "house.fill", stats = "chart.bar.xaxis"
//    case quotes = "quote.closing", settings = "gearshape.fill"
//    var id: Int { hashValue }
//
//    /// Custom header title for each tab
//    var headerTitle: String {
//        switch self {
//        case .home: return "Daily Records"// changed journal to records
//        case .stats: return "Fun Statistics"// unchanged
//        case .quotes: return "Get Inspired"// unchanged
//        case .settings: return "Settings"   // unchanged
//        }
//    }
//}

/// Main dashboard for the app
struct DashboardTestView: View {
    
//    @EnvironmentObject var manager: DataManager
//    @State private var selectedTab: CustomTabBarItem = .home
    
    // MARK: - Main rendering function
    var body: some View {
        ZStack {
            BackgroundGradientView()
            VStack {
                HeaderCalendarView(days: [], selectedDate: Date(), onTapGesture: { _ in
                })
            }
            HomeTabView()
            }
        }
            //                Color("BackgroundColor").ignoresSafeArea()
            //            CustomTabBarContainer
//            CustomTabBarView
            //            PreviewImageFullScreen   // cut so far
        }
        /// Full modal screen flow
        //        .fullScreenCover(item: $manager.fullScreenMode) { type in
//        switch type {
//        case .entryCreator: break
//            //JournalEntryCreatorView().environmentObject(manager)
//        case .premium: break
//            //PremiumView
//        case .passcodeView: break
//            //PasscodeView().environmentObject(manager)
//        case .setupPasscodeView:break
//            //PasscodeView(setupMode: true).environmentObject(manager)
//        }
        //        }
        
//    }
    
    /// Custom tab bar container
    private var CustomTabBarContainer: some View {
        ZStack {
            VStack(spacing: 15) {
                HeaderTitle
                
//                switch selectedTab {
//                case .home:
//                    HeaderCalendarView
////                    DashboardView(user: appUser01)
////                    HomeTabView().environmentObject(manager)
//                case .stats:
//                    HeaderCalendarView
////                    DashboardView(user: appUser01)
////                    StatsTabView().environmentObject(manager)
//                case .quotes:
//                    HeaderCalendarView
////                    DashboardView(user: appUser01)
////                    QuotesTabView().environmentObject(manager)
//                case .settings:
//                    HeaderCalendarView
////                    DashboardView(user: appUser01)
////                    SettingsTabView().environmentObject(manager)
                }
            }
        } //.animation(nil)
    
    /// Header title
    private var HeaderTitle: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text("Date here")
                //                Text(manager.selectedDate.headerTitle)
//                Text(selectedTab.headerTitle).font(.largeTitle).bold()
            }
            Spacer()
        }.padding(.horizontal).foregroundColor(Color("LightColor"))
    }
//
//    /// Header calendar view
//    private var HeaderCalendarView: some View {
//        ScrollView(.horizontal, showsIndicators: false) {
//            ScrollViewReader { proxy in
//                HStack(spacing: 15) {
//                    Spacer(minLength: 0)
//                    ForEach(0..<manager.calendarDays.count, id: \.self) { index in
//                        CalendarItem(atIndex: index).id(index).onTapGesture {
//                            manager.selectedDate = manager.calendarDays[index]
//                        }
//                    }
//                    Spacer(minLength: 0)
//                }.onAppear {
//                    proxy.scrollTo(manager.calendarDays.count-1)
//                }
//            }
//        }
//    }
////
//    /// Header calendar item view
//    private func CalendarItem(atIndex index: Int) -> some View {
//        let date = manager.calendarDays[index]
////        let isTodayItem = date.longFormat == Date().longFormat
////        let isSelectedItem = manager.selectedDate.longFormat == date.longFormat
//        return VStack(spacing: 2) {
//            ZStack {
//                RoundedRectangle(cornerRadius: 8)
//                    .frame(width: 44, height: 39, alignment: .center)
//                    .foregroundColor(Color("BackgroundColor"))
////                    .opacity(isTodayItem ? 1 : (isSelectedItem ? 0.65 : 0.1))
////                Text(date.string(format: "d")).font(.system(size: 22, weight: .semibold))
////                    .foregroundColor(isTodayItem || isSelectedItem ? Color("LightColor") : Color("Primary"))
//            }
////            Text(date.string(format: "E")).font(.system(size: 12))
//                .foregroundColor(Color("Primary"))
//        }.padding(5).background(Color("LightColor").cornerRadius(10))
//    }
//
//    /// Bottom Custom tab bar view
//    private var CustomTabBarView: some View {
//        ZStack {
//            VStack {
//                Spacer()
//                LinearGradient(gradient: Gradient(colors: [Color("ListColor").opacity(0), Color("ListColor").opacity(0.7)]), startPoint: .top, endPoint: .bottom)
//                    .ignoresSafeArea().frame(height: 150).allowsHitTesting(false)
//            }
//            VStack {
//                Spacer()
//                ZStack {
//                    Color("TabBarColor").cornerRadius(40)
//                        .shadow(color: Color.black.opacity(0.2), radius: 10)
//                    HStack(spacing: 35) {
//                        ForEach(CustomTabBarItem.allCases) { tabItem in
//                            TabBarItem(type: tabItem)
//                        }
//                    }
//                }.padding(.horizontal, 30).frame(height: 65)
//            }
//        }
//    }
//
//    private func TabBarItem(type: CustomTabBarItem) -> some View {
//        Button {
//            withAnimation { selectedTab = type }
//        } label: {
//            VStack(spacing: 0) {
//                Spacer()
//                Image(systemName: type.rawValue).font(.system(size: 25, weight: .light))
//                    .foregroundColor(Color("ListColor")).offset(y: -2)
//                    .opacity(selectedTab == type ? 1 : 0.4)
//                Spacer()
//                Circle().foregroundColor(.white)
//                    .frame(width: 20, height: 20)
//                    .opacity(selectedTab == type ? 1 : 0)
//            }.offset(y: 12).mask(Rectangle())    // over wrap Circle on top
//        }
//    }
//
    
    // MARK: - Preview UI
struct DashboardTestView_Previews: PreviewProvider {
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
            ZStack {
                //            DashboardTestView()
                BackgroundGradientView()
                VStack {
                    HeaderCalendarView(days: days, selectedDate:Date(), onTapGesture: {
                        _ in
                    } )
                    HomeTabView()
                }
                //            TabView {
                //                HomeTabView()
                //                    .tabItem{
                //                        Label("Home", systemImage: "house")
                //                    }
                //                TabAView()
                //                    .tabItem{
                //                        Label("Add", systemImage: "plus.circle")
                //                    }
                //                TabBView()
                //                    .tabItem{
                //                        Label("Detail", systemImage: "list.dash")
                //                    }
            }
            //        DashboardTestView()
            //        DashboardTestView().environmentObject(DataManager(preview: true))
        }
    }
