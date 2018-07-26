//
//  PersistenceData.swift
//  SomeDayList
//
//  Created by Tirath on 2018-04-01.
//  Copyright © 2018 Tirath. All rights reserved.
//

import Foundation
import CoreData

class PersistenceData{
    
    private init(){}
    
    static var context:NSManagedObjectContext{
        return persistentContainer.viewContext
    }
    
    
    static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    static func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges{
            do{
                try context.save()
                
            }
            catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }
    }
}
