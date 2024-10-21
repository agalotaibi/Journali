//
//  EmptyState.swift
//  Journali
//
//  Created by Amaal on 17/04/1446 AH.
//

import SwiftUI

struct EmptyState: View {
    @State private var showingSheet = false
    @StateObject var viewModel: addJournalViewModel

    var body: some View {
        NavigationStack{
            VStack(spacing: 20){
                HStack{
                    Text("Journal")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                    HStack{
                        Image(systemName: "plus").frame(width: 40, height: 40).background(Color(.elem))
                            .cornerRadius(90).onTapGesture {
                                showingSheet.toggle()
                            }
                            .sheet(isPresented: $showingSheet) {
                                // Pass the same viewModel to SetReminder
                                NewJournal(viewModel: viewModel)
                            }
                        
                    }.foregroundStyle(Color(.main))
                }.padding()
                
                Spacer()
                Image("book")
                Text("Begin Your Journal")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color(.main))
                Text("Craft your personal diary, \n tap the plus icon to begin")
                
                Spacer()
            }
        }
    }
}

#Preview {
    let viewModel = addJournalViewModel()
    EmptyState(viewModel: addJournalViewModel())
}
