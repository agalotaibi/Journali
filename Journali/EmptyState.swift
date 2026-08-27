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
               
                
                Spacer()
                VStack{
                    Image("emptybook")
                        .resizable()
                        .frame(width: 151.39, height: 97.32)
                    
                    Text("Begin Your Journal")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(Color(.main))
                        .padding()
                    
                    Text("Craft your personal diary, \n tap the plus icon to begin")
                }
                
                Spacer()
            }.navigationTitle("Journal").toolbar {
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    
                    label:do {Image(systemName: "plus").foregroundStyle(Color(.main))
                            .frame(width: 40, height: 40)
                            .background(Color(.elem))
                            .cornerRadius(90).onTapGesture {
                                showingSheet.toggle()
                            }
                            .sheet(isPresented: $showingSheet) {
                                // Pass the same viewModel to SetReminder
                                NewJournal(viewModel: viewModel)
                            }
                    }
                    
                }
                }
        }
    }
}

#Preview {
    let viewModel = addJournalViewModel()
    EmptyState(viewModel: addJournalViewModel())
}
