//
//  addJournalViewModel.swift
//  Journali
//
//  Created by Amaal on 17/04/1446 AH.
//

import Foundation
import SwiftUI

class addJournalViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var date: Date = Date()
    @Published var description: String = ""
    @Published var isChecked: Bool = false
    @Published var journal: [JournalModel] = []
    
    func addJournal() {
        let newJournal = JournalModel(
            title: title,
            description: description,
            date: date,
            isChecked: isChecked)
        
        journal.append(newJournal)
    }
    
//    func toggleCheckmark() {
//        journal.isChecked.toggle() // Toggle the isChecked property
//        
//
//       }
}
