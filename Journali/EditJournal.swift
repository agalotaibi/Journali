//
//  EditJournal.swift
//  Journali
//
//  Created by Amaal on 18/04/1446 AH.
//

import SwiftUI

struct EditJournal: View {
    @ObservedObject var viewModel: addJournalViewModel
        @State var journal: JournalModel
    @Environment(\.dismiss) private var dismiss
    var body: some View {
//           Form {
//            TextField("Title", text: $journal.title)
//            TextField("Description", text: $journal.description)
//            Button("Save") {
//                if let index = viewModel.journal.firstIndex(where: { $0.id == journal.id }) {
//                    viewModel.journal[index] = journal // Update journal in the view model
//                }
//            }
//        }
        
        VStack {
            NavigationStack {
                VStack(alignment:.leading){
                    TextField("Title", text: $journal.title).frame(width: 300, height: 30).font(.title).fontWeight(.bold)
                    Text(Date.now, format: .dateTime.day().month().year())
                        .font(.callout)
                    TextField("Type your Journal…", text:$journal.description, axis: .vertical).multilineTextAlignment(TextAlignment.leading).font(.title3).padding()
                    Spacer()
                }.padding().toolbar {
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Save"){
                            if let index = viewModel.journal.firstIndex(where: { $0.id == journal.id }) {
                                viewModel.journal[index] = journal // Update journal in the view model
                            }
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

//#Preview {
//    let viewModel = addJournalViewModel()
//    let journal = JournalModel(title: <#String#>, description: <#String#>, date: <#Date#>, isChecked: <#Bool#>)
//    EditJournal(viewModel: addJournalViewModel(), journal: JournalModel())
//}
