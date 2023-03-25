//
//  DashboardView.swift
//  AllDone01
//
//  Created by 湯川隆臣 on 2023/03/12.
//

import SwiftUI

struct DashboardView: View {
    
    let user: AppUser
    
    @State var searchText: String = ""

    @ObservedObject var viewModel = TODOViewModel()
    
    var body: some View {
        
        ZStack {
            
            VStack{
                HStack {
                    Spacer()
                    Text("- UPPPER -")
                        .font(.system(size: 24))
                        .fontWeight(.semibold)
                    Spacer()
                } // end of HStack
                .overlay {
                    HStack {
                        Spacer()
                        Button {
                            AuthViewModel.shared.signout()
                        } label: {
                            Text("Logout")
                                .foregroundColor(Color(.systemGray))
                        }
                        .padding(.trailing)
                    }
                } // end of HStack overlay
                
                SearchBarView(searchText: $searchText)
                    .padding()
                
                TODOButtonStack(viewModel: viewModel)
                    .padding(.horizontal)
                    .padding(.bottom)
                
                if viewModel.todosFiltered.isEmpty {
                    AddTODOLogo()
                        .padding(.top)
                }
                
                ScrollView {   // if I want horizontal, do (.horizontal) otherwise vertical
                    
                    LazyVStack(spacing: 15){
                        
                        ForEach (viewModel.todosFiltered, id: \.id) { todo in
                            
                            if searchText == "" {
                                TODOView(todo: TODO(ownerUid: todo.ownerUid, title: todo.title, description: todo.description, TODOType: todo.TODOType, completed: todo.completed, documentID: todo.documentID), viewModel: viewModel)
                            } else {
                                if todo.title.lowercased().contains(searchText.lowercased()) ||
                                    todo.description.lowercased().contains(searchText.lowercased()) {
                                    TODOView(todo: TODO(ownerUid: todo.ownerUid, title: todo.title, description: todo.description, TODOType: todo.TODOType, completed: todo.completed, documentID: todo.documentID), viewModel: viewModel)
                                } // end of IF statement
                            } // end of else statement
                            
                        } // end of ForEach
                    } // end of VStack
                } // end of ScrollView
                
                
            } // end of VStack
            .overlay(
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button {
                            viewModel.showCreateTODOView = true
                        } label: {
                            Image(systemName: "plus")
                                .padding()
                                .foregroundColor(.white)
                                .frame(width: 60, height: 60)
                                .background(Color("lightBlue"))
                                .cornerRadius(30)
                        }
                        .padding(20)
                        .padding(.bottom, 120)
                        } // end of HStack
                    
                    } // end of VStack
            )
            
            if viewModel.showCreateTODOView {
                BlankView()
                CreateTODOView(user: user, viewModel: viewModel)
            }
            
        } // end of Zstack
        
//        VStack {
//            Text("DashboardView")
//            Button {
//                AuthViewModel.shared.signout()
//            } label: {
//                Text("Log Out")
//            }
//            .padding()
//
//
//        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(user: appUser01 )
//        TODOView(todo: todo01, viewModel: TODOViewModel())
    }
}
