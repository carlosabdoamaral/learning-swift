//
//  DataController.swift
//  MyDiary
//
//  Created by Carlos Amaral on 01/01/22.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "DiaryModel")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core data error while loading \(error.localizedDescription)")
            }
        }
    }
}
