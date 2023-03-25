//
//  EntryTabView.swift
//  AllDone01
//
//  Created by 湯川隆臣 on 2023/03/26.
//

import SwiftUI

struct EntryTabView: View {
    
    let user: AppUser
    
    @State var exercise: String = ""
    @State var date = Date()
    @State var weight: Float = 0.0
    @State var reps: Int = 0
    
    @ObservedObject var viewModel: TODOViewModel
    @ObservedObject var viewModel2: EntryViewModel
    
    var body: some View {
        ZStack{
        RoundedCorner(radius: 30, corners: [.topLeft, .topRight])
            .padding(.top, 6)
            .foregroundColor(Color("ListColor")).ignoresSafeArea()
        VStack(spacing: 0){
            Capsule().frame(width: 50, height: 5).padding(12)
                .foregroundColor(Color("DarkColor"))
//            Spacer()
            
            
//            ZStack{
                VStack {
                    TODOButtonStack(viewModel: viewModel)
                        .padding()
                        .padding(.top)
                    EntryTabBackground()
                    TODOTextField(text: $exercise, placeholder: "Exercise...")
                        .padding([.horizontal, .bottom])
                        .frame(width: UIScreen.main.bounds.size.width - 50)
                    
                    HStack(alignment: .center) {
                        ValueInputField(imageName: "dumbbell.fill")
                        Text("kg")
                        Text("x")
                        ValueInputField(imageName: "square.stack.3d.up")
                        Text("times")
                    }
                    .padding(.horizontal)
                    .frame(width: UIScreen.main.bounds.size.width - 70)
                    
                    Button {
                        viewModel2.onTapEntry()
                    } label: {
                        EntryRegisterButton()
                    }
                }
                .padding(.bottom, 10)
                Spacer()
            } // end of VStack
        } // end of ZStack
        
        
        //        .frame(width: UIScreen.main.bounds.size.width - 100, height: 360)
        //        .background(Color(.systemGray5))
        //        .cornerRadius(25)
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
            Text ("Create")
                .font(.headline)
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.size.width - 140, height: 40)
                .background(Color.gray.opacity(0.6))
                .clipShape(Capsule())
            
        }
    }
}
