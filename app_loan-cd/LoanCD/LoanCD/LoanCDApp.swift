//
//  LoanCDApp.swift
//  LoanCD
//
//  Created by Carlos Amaral on 23/11/21.
//

import SwiftUI

@main
struct LoanCDApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            LoanView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
