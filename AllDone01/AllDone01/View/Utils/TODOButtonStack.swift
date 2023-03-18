//
//  TODOButtonStack.swift
//  AllDone01
//
//  Created by 湯川隆臣 on 2023/03/13.
//

import SwiftUI

struct TODOButtonStack: View {
    
    @ObservedObject var viewModel: TODOViewModel
    
    
    var body: some View {

        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                TODOButton(buttonType: .all, viewModel: viewModel)
                
                TODOButton(buttonType: .chest, viewModel: viewModel)
                
                TODOButton(buttonType: .back, viewModel: viewModel)
                
                TODOButton(buttonType: .legs, viewModel: viewModel)
                
                TODOButton(buttonType: .core, viewModel: viewModel)
                
                TODOButton(buttonType: .shoulder, viewModel: viewModel)
                
                TODOButton(buttonType: .arms, viewModel: viewModel)
                
                TODOButton(buttonType: .exercize, viewModel: viewModel)
                
                TODOButton(buttonType: .run, viewModel: viewModel)
                
                TODOButton(buttonType: .extra, viewModel: viewModel)
                
//            case all = "All"
//            case chest = "Chest"
//            case back = "Back"
//            case legs = "Legs"
//            case core = "Core"
//            case shoulder = "Shoulder"
//            case arms = "Arms"
//            case exercize = "Exercize"
//            case run = "Run"
//            case extra = "Extra"
                
            }
        }
        
    }
}

struct TODOButtonStack_Previews: PreviewProvider {
    static var previews: some View {
        TODOButtonStack(viewModel: TODOViewModel())
    }
}

struct TODOButton: View {
    
    let buttonType: selectedButton
    @ObservedObject var viewModel: TODOViewModel
    
    var body: some View {
        Button {
            viewModel.filterTODOSelected = buttonType
            
            if viewModel.filterTODOSelected != .all {
                viewModel.todosFiltered = viewModel.todos.filter { todo in
                    return todo.TODOType == viewModel.filterTODOSelected.rawValue
                }
            } else {
                viewModel.todosFiltered = viewModel.todos
            }
            
        } label: {
            Text("\(buttonType.getValue())")
                .foregroundColor(viewModel.filterTODOSelected == buttonType ?
                    .white : Color(.systemGray))
                .frame(width: 100, height: 40)
                .backgroundStyle(buttonType == viewModel.filterTODOSelected ? Color(.blue) : Color(.systemGray6))
                .cornerRadius(20)
        }

        
        
    }
}
