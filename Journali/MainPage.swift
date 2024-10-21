//
//  MainPage.swift
//  Journali
//
//  Created by Amaal on 17/04/1446 AH.
//

import SwiftUI

struct MainPage: View {
    
    @State private var searchText = ""
    @State private var showingSheet = false
    @State var isActive = true
    //    @EnvironmentObject var viewModel: addJournalViewModel
    @StateObject var viewModel: addJournalViewModel
    @State private var showBookmarkedOnly = false
    @State private var selectedJournal: JournalModel?
    @State private var sortOldestFirst = true
    
    var body: some View {
        
        if isActive{
            VStack{
                Image("book")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .padding()
                Text("Journali")
                    .font(.title).fontWeight(.bold)
                Text("Your thoughts, your story")
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            withAnimation {
                                self.isActive = false
                            }
                        }
                    }
            }
        }
        else{
            if viewModel.journal.isEmpty{
                EmptyState(viewModel: viewModel)
            }
            else{
                NavigationStack{
                    VStack(spacing: 20){
                        List{
                            ForEach(viewModel.journal.filter { !showBookmarkedOnly || $0.isChecked }.sorted { sortOldestFirst ? $0.date < $1.date : $0.date > $1.date }) { journl in
                                VStack(alignment: .leading, spacing: 10){
                                    HStack{
                                        Text(journl.title)
                                            .font(.title2)
                                            .fontWeight(.bold)
                                            .foregroundStyle(Color(.main))
                                        Spacer()
                                        Image(systemName: journl.isChecked ? "bookmark.fill" : "bookmark").resizable().scaledToFit().frame(width: 20).foregroundStyle(Color(.main))
                                    }.onTapGesture {
                                        
                                        if let index = viewModel.journal.firstIndex(where: { $0.id == journl.id }) {
                                            viewModel.journal[index].isChecked.toggle()
                                        }
                                        
                                    }
                                    Text(Date.now, format: .dateTime.day().month().year())
                                        .font(.callout)
                                    
                                    Text(journl.description)
                                } .swipeActions(edge: .leading) {
                                    Button {
                                        
                                        // Set the selected journal to edit
                                        selectedJournal = journl
                                        showingSheet.toggle()
                                    }
                                    label:{Image(systemName: "pencil.circle.fill") }
                                        .tint(Color(.accent))
                                }}.onDelete(perform: deleteJournal)
                        }
                        
                    }.navigationTitle("Journal").toolbar {
                        
                        ToolbarItem(placement: .navigationBarTrailing) {
                            
                            Menu {
                                Button(" \(showBookmarkedOnly ? "All" : "Bookmarked") Journals") {
                                    
                                    showBookmarkedOnly.toggle()
                                
                                }
                                Button("Sort by Date (\(sortOldestFirst ? "Oldest First" : "Newest First"))") {
                                                                 // Toggle sorting order
                                                                 sortOldestFirst.toggle()
                                                             }
                            }
                            
                            
                            label:{Image(systemName: "line.3.horizontal.decrease").foregroundStyle(Color(.main))
                                    .frame(width: 40, height: 40)
                                    .background(Color(.elem))
                                    .cornerRadius(90)
                            }
                            
                            
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {Image(systemName: "plus").foregroundStyle(Color(.main))
                                .frame(width: 40, height: 40).background(Color(.elem))
                                .cornerRadius(90).onTapGesture {
                                    showingSheet.toggle()
                                }
                                .sheet(isPresented: $showingSheet) {
                                    // Pass the same viewModel to SetReminder
                                    
                                    if let journalToEdit = selectedJournal {
                                        // Edit the existing journal
                                        EditJournal(viewModel: viewModel, journal: journalToEdit)
                                    } else {
                                        // Add a new journal
                                        NewJournal(viewModel: viewModel)
                                    }
                                    //                                    NewJournal(viewModel: viewModel)
                                }
                            
                            
                        }
                        
                    }
                    .searchable(text: $searchText)
                }
            }
        }
    }
    
    func deleteJournal(at offset: IndexSet) {
        viewModel.journal.remove(atOffsets: offset)
    }
}

#Preview {
    let viewModel = addJournalViewModel()
    MainPage(viewModel: addJournalViewModel())
}
