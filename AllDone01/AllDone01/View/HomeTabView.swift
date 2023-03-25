//
//  HomeTabView.swift
//  AllDone01
//
//  Created by 湯川隆臣 on 2023/03/21.
//

import SwiftUI

struct HomeTabView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    @EnvironmentObject var viewModel2: EntryViewModel
    
    // MARK: - Main rendering function
    var body: some View {
        ZStack {
//            BackgroundGradientView().ignoresSafeArea()
            RoundedCorner(radius: 30, corners: [.topLeft, .topRight])
                .foregroundColor(Color("ListColor")).ignoresSafeArea()
                VStack(spacing: 0){
                    Capsule().frame(width: 50, height: 5).padding(12)
                        .foregroundColor(Color("DarkColor"))
                    Spacer()
                    
                    // Temporarily set up with CheckInBannerView and EmptyListView
                    VStack{
                        CheckInBanner1View
                        EmptyList1View
                        Spacer()
                }
// Not yet DB available so crossing it out 後でIf文を完了してデータをロードし表示する
//                if let entries = results.filter({ $0.date?.longFormat == manager.selectedDate.longFormat }), entries.count > 0 {
//                    ScrollView(.vertical, showsIndicators: false) {
//                        Spacer(minLength: 6)
//                        LazyVStack(spacing: 0) {
//                            CheckInBanner1View
//                            ForEach(entries.sorted(by: { $0.date ?? Date() > $1.date ?? Date() })) { entry in
//                                JournalEntryItem(model: entry)
//                            }
//                        }
//                        Spacer(minLength: 100)
//                    }
//                } else {
//                    CheckInBannerView.padding(.top, 6)
//                    EmptyListView
//                }
            }
        }.padding(.top, 10)
    }
}

/// Check-in banner view
private var CheckInBanner1View: some View {
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
//                    EntryTabView(user: user, viewModel: TODOViewModel(), viewModel2: EntryViewModel())
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

/// Empty view
private var EmptyList1View: some View {
    VStack {
        Spacer()
        Image(systemName: "list.star").font(.largeTitle).padding(2)
        Text("No Entries Yet").font(.title3).bold()
        Text("You don't have any entries for today\nTap the 'Check-In' button to add an entry")
            .font(.subheadline).opacity(0.6)
        //            Spacer()
        Button {
//            EntryTabView(user: user, viewModel: TODOViewModel(), viewModel2: EntryViewModel())
            // Set up next view to move on
            //manager.fullScreenMode = .entryCreator
        } label: {
            ZStack {
                Color("BackgroundColor").cornerRadius(10)
                    .frame(width: 200, height: 40)
                    .opacity(0.9)
                //                    Color("ListColor").cornerRadius(10) .padding()
                Text("Check-In").font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Color("ListColor"))
            }.frame(width: 88, height: 42)
        }.padding(.top, 20)
        Spacer()
    }.multilineTextAlignment(.center).foregroundColor(Color("TextColor"))
}

/// Empty view
private var HomeTabHeader: some View {
    ZStack {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text("HeaderHere")
                Text("HeaderSubtextHere").font(.largeTitle).bold()
            }
        }.padding(.horizontal).foregroundColor(Color("LightColor"))

    }.multilineTextAlignment(.center).foregroundColor(Color("TextColor"))
}


struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
