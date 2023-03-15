//
//  TODOView.swift
//  AllDone01
//
//  Created by 湯川隆臣 on 2023/03/13.
//

import SwiftUI

struct TODOView: View {
    
    var todo: TODO
    
    @ObservedObject var viewModel: TODOViewModel
    
    var body: some View {
        
        HStack {
            Button {
                if todo.completed {
                    viewModel.unCompleteTODO(todoID: todo.documentID ?? "")
                } else {
                    viewModel.completeTODO(todoID: todo.documentID ?? "")
                }
            } label: {
                Image(systemName: todo.completed ? "checkmark.square.fill" : "square")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(Color("lightBlue"))
                
            }

            VStack(alignment: .leading, spacing: 5) {
                Text(todo.title)
                    .font(.system(size: 18))
                
                if todo.description != "" {
                    HStack {
                        Image(systemName: "line.3.horizontal")
                            .resizable()
                            .frame(width: 15, height: 10)
                            .foregroundColor(Color("lightBlue"))
                        
                        Text("\(todo.description)")
                            .font(.system(size: 14))
                            .foregroundColor(Color(.systemGray2))
                    
                    }
                }
                
            } // end of VStack
            .padding(.leading, 10)
            
            Spacer()
            
            Button {
                viewModel.deleteTODOs(todoID: todo.documentID ?? "")
            } label: {
                Image(systemName: "x.circle")
                    .foregroundColor(.red)
                    .frame(width: 22, height: 22)
            }
        
        } // end of HStack
        .padding(20)
        .frame(width: UIScreen.main.bounds.size.width - 25, height:70)
        .background(Color(.systemGray6))
        .cornerRadius(20)
    }
}

struct TODOView_Previews: PreviewProvider {
    static var previews: some View {
        TODOView(todo: todo01, viewModel: TODOViewModel())
    }
}
