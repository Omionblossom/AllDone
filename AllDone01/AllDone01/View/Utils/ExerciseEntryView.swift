//
//  ExerciseEntryView.swift
//  AllDone01
//
//  Created by 湯川隆臣 on 2023/03/26.
//

import SwiftUI

/// Journal Entry Creation steps
enum EntryCreationStep: Int, CaseIterable, Identifiable {
    case moodLevel, reasons, text, images
    var id: Int { hashValue }
    
    /// Step question
    var question: String {
        switch self {
        case .moodLevel: return "Hello, how do you feel today?"
        case .reasons: return "What makes you feel this way?"
        case .text: return "Write a few words or paragraphs about your day"
        case .images: return "Do you want to attach any photos?"
        }
    }
}

struct ExerciseEntryView: View {
    
    let user: AppUser
    @ObservedObject var viewModel2: EntryViewModel
    
    @Environment(\.colorScheme) var colorScheme
    var currentStep: EntryCreationStep = .moodLevel
    @State var moodLevel: MoodLevel?
    @State var moodText: String = ""
        
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                ForEach(MoodLevel.allCases) { level in
                    Image("\(level)").opacity(moodLevel == level ? 1 : 0.3)
                        .onTapGesture { moodLevel = level }
                }.frame(maxWidth: .infinity)
            }
            ZStack {
                Color("Primary").cornerRadius(20)
                    .opacity(colorScheme == .dark ? 1 : 0.1)
                if let mood = moodLevel {
                    /// List of mood options
                    ScrollView(.vertical, showsIndicators: false) {
                        ForEach(0..<mood.moodOptions.count, id: \.self) { index in
                            HStack {
                                Text(mood.moodOptions[index])
                                Spacer()
                                Image(systemName: moodText == mood.moodOptions[index] ? "circle.fill" : "circle")
                                    .font(.system(size: 16))
                            }
                            .padding().background(Color("ListColor"))
                            .opacity(moodText == mood.moodOptions[index] ? 0.5 : 1)
                            .contentShape(Rectangle()).onTapGesture {
                                moodText = mood.moodOptions[index]
                            }
                        }.cornerRadius(10).padding()
                    }
                }
            }
//            Button {   // Record entry action -> EntryViewModel
//                viewModel2.onInputExercise(moodText)
////                viewModel2.onTapEntry()
//            } label: {
//                EntryRegisterButton()
//            }
//            NextButtonView(disabled: moodLevel == nil || moodText.isEmpty)
        }.padding(.horizontal)
    }
    
//    struct ExerciseEntryView_Previews: PreviewProvider {
//        static var previews: some View {
//            ExerciseEntryView(user: user, viewModel2: EntryViewModel)
//        }
//    }
    
    struct EntryRegisterButton: View {
        var body: some View {
            Text ("Select")
                .font(.headline)
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.size.width - 140, height: 40)
                .background(Color.gray.opacity(0.6))
                .clipShape(Capsule())
        }
    }
}


