//
//  RecordView.swift
//  AllDone01
//
//  Created by 湯川隆臣 on 2023/03/26.
//

import SwiftUI

struct RecordView: View {
    
    var record: Exercise

    @ObservedObject var viewModel: ShowRecordsViewModel
    
    var body: some View {

        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Text(record.exercise)
                    .font(.system(size:24))
                    .padding(.leading, 40)
                Spacer()
                if let date = record.date {
                    Text(date.string(format: "h:mm a")).font(.system(size: 12, weight: .medium)).opacity(0.5).padding(.trailing, 20)
                }
            }
            HStack{
                Text("\(record.weight)")
                Text("kg")
                Text("x")
                Text("\(record.reps)")
                Text("reps")
                Spacer()
            }.padding(.leading, 40)
        }.frame(width: UIScreen.main.bounds.size.width - 50, height: 80)
            .background(Color(.systemGray6))
            .cornerRadius(20)
    }
}

struct RecordView_Previews: PreviewProvider {
    static var previews: some View {
        RecordView(record: exercise01, viewModel: ShowRecordsViewModel())
    }
}
