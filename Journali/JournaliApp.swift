//
//  JournaliApp.swift
//  Journali
//
//  Created by Amaal on 17/04/1446 AH.
//

import SwiftUI

@main
struct JournaliApp: App {
//    @StateObject var vm = addJournalViewModel()
    let viewModel = addJournalViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainPage(viewModel: addJournalViewModel())
//                .environmentObject(vm)
        }
    }
}
