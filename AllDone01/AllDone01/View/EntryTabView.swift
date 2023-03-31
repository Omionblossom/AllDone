//
//  EntryTabView.swift
//  AllDone01
//
//  Created by 湯川隆臣 on 2023/03/26.
//

import SwiftUI

struct EntryTabView: View {
    
    let user: AppUser
    
    @ObservedObject var viewModel: TODOViewModel
    @ObservedObject var viewModel2: EntryViewModel
    
    var body: some View {
        ZStack {
            BackgroundGradientView()
            VStack {
                HeaderTitle
                ZStack{
                RoundedCorner(radius: 30, corners: [.topLeft, .topRight])
                    .padding(.top, 6)
                    .foregroundColor(Color("ListColor")).ignoresSafeArea()
                VStack(spacing: 0){
                    Capsule().frame(width: 50, height: 5).padding(12)
                        .foregroundColor(Color("DarkColor"))
        //            ZStack{
                        VStack {
                            ExerciseEntryView(user: user, viewModel2: EntryViewModel())
//                            TODOButtonStack(viewModel: viewModel)
//                                .padding()
//                                .padding(.top)
//                            EntryTabBackground()
                            HStack {
                                TextField("Enter Exercise", text: .init(get: {
                                    "\(viewModel2.state.exercise)"
                                }, set: {
                                    viewModel2.onInputExercise($0)
                                }))
//                                Button {
//                                    viewModel2.showExerciseEntryView = true
//                                } label: {
//                                    Image(systemName: "text.book.closed")
//                                        .padding(.trailing, 12)
//                                        .foregroundColor(Color(.systemPink))
//                                }

                            }
                            .padding([.horizontal, .bottom])
                            .frame(width: UIScreen.main.bounds.size.width - 50)

                            
                            HStack(alignment: .center) {
                                Image(systemName: "dumbbell.fill")
                                TextField("", text: .init(get: {
                                    "\(viewModel2.state.weight)"
                                }, set: {
                                    viewModel2.onInputWeight($0)
                                }))
                                Text("kg")
                                Text("x")
                                Image(systemName: "square.stack.3d.up")
                                TextField("", text: .init(get: {
                                    "\(viewModel2.state.reps)"
                                }, set: {
                                    viewModel2.onInputReps($0)
                                }))
                                Text("reps")
                            }
                            .foregroundColor(.gray)
                            .padding(.horizontal)
                            .frame(width: UIScreen.main.bounds.size.width - 70)

                            Button {   // Record entry action -> EntryViewModel
                                viewModel2.onTapEntry()
                            } label: {
                                EntryRegisterButton()
                            }
                        }
                        .padding(.bottom, 10)
                        Spacer()
                    } // end of VStack
                    
        //            if $viewModel2.showExerciseEntryView {
        //                BlankView()
        //                ExerciseEntryView(user: user, viewModel2: viewModel2)
                }
            }
        }
            
        } // end of ZStack
    
    /// Header title
    private var HeaderTitle: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
//                Text("Day, YYYY/MM/DD")
                Text("Stay motivated!")
                Text("Register Records")
                    .font(.largeTitle).bold()
                //                Text(manager.selectedDate.headerTitle)
//                Text(selectedTab.headerTitle).font(.largeTitle).bold()
            }
            Spacer()
        }.padding(.horizontal).foregroundColor(Color("LightColor"))
    }
    
    }
    
    struct EntryTabView_Previews: PreviewProvider {
        static var previews: some View {
            EntryTabView(user: appUser01, viewModel: TODOViewModel(), viewModel2: EntryViewModel())
        }
    }
    
    
    struct EntryTabBackground: View {
        var body: some View {
            Text ("")
                .frame(width: UIScreen.main.bounds.size.width - 20, height: 240)
                .background(Color(.systemGray5))
                .cornerRadius(25)
        }
    }
    
    
    struct EntryRegisterButton: View {
        var body: some View {
            Text ("Record entry")
                .font(.headline)
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.size.width - 140, height: 40)
                .background(Color.gray.opacity(0.6))
                .clipShape(Capsule())
            
        }
    }

