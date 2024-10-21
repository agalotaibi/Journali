//
//  NewJournal.swift
//  Journali
//
//  Created by Amaal on 17/04/1446 AH.
//

import SwiftUI

struct NewJournal: View {
    @Environment(\.dismiss) private var dismiss
   // @EnvironmentObject var viewModel: addJournalViewModel
    @StateObject var viewModel: addJournalViewModel
    var body: some View {
        VStack {
            NavigationStack {
                VStack(alignment:.leading){
                    TextField("Title", text: $viewModel.title).frame(width: 300, height: 30).font(.title).fontWeight(.bold)
                    Text(Date.now, format: .dateTime.day().month().year())
                        .font(.callout)
                    TextField("Type your Journal…", text:$viewModel.description, axis: .vertical).multilineTextAlignment(TextAlignment.leading).font(.title3).padding()
                    Spacer()
                }.padding().toolbar {
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Save"){
                            viewModel.addJournal()
                            dismiss()
                        }.foregroundStyle(Color(.main))
                    }
                    
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Cancel") {
                            dismiss()
                        }.foregroundStyle(Color(.main))
                    }
                }
            }
        }
            
        
    }
}

#Preview {
    let viewModel = addJournalViewModel()
    NewJournal(viewModel: addJournalViewModel())
}
