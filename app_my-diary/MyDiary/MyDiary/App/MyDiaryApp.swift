//
//  MyDiaryApp.swift
//  MyDiary
//
//  Created by Carlos Amaral on 01/01/22.
//

import CoreData
import SwiftUI

@main
struct MyDiaryApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
