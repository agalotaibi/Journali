//
//  JournalModel.swift
//  Journali
//
//  Created by Amaal on 17/04/1446 AH.
//

import Foundation
import SwiftUI

struct JournalModel: Identifiable {
    let id = UUID()
    var title: String
    var description: String
    var date: Date
    var isChecked: Bool
   
}
