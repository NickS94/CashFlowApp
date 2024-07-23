//
//  PersistentStore.swift
//  CashFlow
//
//  Created by Nikos Stauropoulos on 23.07.24.
//

import Foundation
import CoreData


class PersistentStore {
    
    static let shared = PersistentStore()
    
    var context: NSManagedObjectContext {
        return container.viewContext
    }
    
    private let container: NSPersistentContainer
    
    private init() {
        container = NSPersistentContainer(name: "DatabaseModel")
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError(error.localizedDescription)
            }
            print("Datenbank geladen")
        }
    }
    
}
