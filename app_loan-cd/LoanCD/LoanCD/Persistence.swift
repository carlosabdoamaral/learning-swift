//
//  Persistence.swift
//  LoanCD
//
//  Created by Carlos Amaral on 23/11/21.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentCloudKitContainer
    var viewContext : NSManagedObjectContext {
        return container.viewContext
    }

    init(inMemory: Bool = false) {
        container = NSPersistentCloudKitContainer(name: "LoanCD") //Tem que ser igual o core data la, icone de um banco de dados
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
    
    func save() {
        
        do {
            try viewContext.save()
        }
        catch {
            print("Error saving", error.localizedDescription)
        }
    }
}
