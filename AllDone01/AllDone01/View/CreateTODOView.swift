//
//  CreateTODOView.swift
//  AllDone01
//
//  Created by 湯川隆臣 on 2023/03/13.
//

import SwiftUI

struct CreateTODOView: View {
    
    let user: AppUser
    
    @State var title: String = ""
    @State var TODOdescription: String = ""
    @State var TODOType: String = ""
    @State var completed: Bool = false
    
    @ObservedObject var viewModel: TODOViewModel
    
    var body: some View {

        VStack {
            
            TODOButtonStack(viewModel: viewModel)
                .padding()
                .padding(.top)
            
            TODOTextField(text: $title, placeholder: "Exercize...")
                .padding([.horizontal, .bottom])
            
//            CustomTextEditor(text: $TODOdescription, placeholder: Text("Description..."), imageName: "line.3.horizontal", foregroundColor: .gray)
//                .padding([.horizontal, .bottom])

            CustomTextField(text: $TODOdescription, placeholder: Text("Description..."), imageName: "line.3.horizontal", foregroundColor: .gray)
                .padding([.horizontal, .bottom])

            
            HStack {
                Button {
                    viewModel.uploadTODOs(todo: TODO(ownerUid: user.id ?? "", title: title, description: TODOdescription, TODOType: viewModel.filterTODOSelected == .all ? "Extra" : viewModel.filterTODOSelected.rawValue, completed: false))
                    viewModel.showCreateTODOView = false
                } label: {
                    CreateTODOButton()
                }

                Button {
                    viewModel.showCreateTODOView = false
                } label: {
                    CancelTODOButton()
                }

            }
            .padding(.bottom, 10)
            
            Spacer()
        } // end of VStack
        .frame(width: UIScreen.main.bounds.size.width - 100, height: 360)
        .background(Color(.systemGray5))
        .cornerRadius(25)
    }
}

struct CreateTODOView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTODOView(user: appUser01, viewModel: TODOViewModel())
    }
}


struct CreateTODOButton: View {
    var body: some View {
        Text ("Create")
            .font(.headline)
            .foregroundColor(.white)
            .frame(width: 80, height: 40)
            .background(Color.blue.opacity(0.6))
            .clipShape(Capsule())
        
    }
}

struct CancelTODOButton: View {
    var body: some View {
        Text ("Cancel")
            .font(.headline)
            .foregroundColor(.white)
            .frame(width: 80, height: 40)
            .background(Color.red.opacity(0.6))
            .clipShape(Capsule())
        
    }
}
