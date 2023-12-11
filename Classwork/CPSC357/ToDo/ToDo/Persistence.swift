//
//  Persistence.swift
//  ToDo
//
//  Created by Tyler Kay on 11/15/23.
//

import CoreData

struct PersistentController{
    static let shared = PersistentController()
    let container: NSPersistentContainer
    init(){
        container = NSPersistentContainer(name: "Todo")
        container.loadPersistentStores(completionHandler:
                                        {(storeDescription, error) in
            if let error = error as NSError? {
                fatalError("unresolved error:\(error)")
            }
        })
    }
}
