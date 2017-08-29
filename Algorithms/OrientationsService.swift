//
//  OrientationsService.swift
//  Algorithms
//
//  Created by Lawrence Chang on 8/28/17.
//  Copyright © 2017 Lawrencium. All rights reserved.
//

import CoreData

class OrientationsService{
    
    var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext){
        self.context = context
    }
    
    // Creates a new OrientationEntity
    func create(id: Int, status: String) -> OrientationEntity {
        let newItem = NSEntityDescription.insertNewObject(forEntityName: "OrientationEntity", into: context) as! OrientationEntity
        newItem.id = Int16(id)
        newItem.status = status
        return newItem
    }
    
    // Gets a PermutationEntity by id
    func getById(id: NSManagedObjectID) -> OrientationEntity? {
        return context.object(with: id) as? OrientationEntity
    }
    
    // Gets all.
    func getAll() -> [OrientationEntity]{
        return get(withPredicate: NSPredicate(value:true))
    }
    
    // Gets all that fulfill the specified predicate.
    func get(withPredicate queryPredicate: NSPredicate) -> [OrientationEntity] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "OrientationEntity")
        fetchRequest.predicate = queryPredicate
        do {
            let response = try context.fetch(fetchRequest)
            return response as! [OrientationEntity]
        } catch let error as NSError {
            print(error)
            return [OrientationEntity]()
        }
    }
    
    // Updates a OrientationEntity
    func update(updatedOrientationEntity: OrientationEntity) {
        if let orientation = getById(id: updatedOrientationEntity.objectID) {
            orientation.id = updatedOrientationEntity.id
            orientation.status = updatedOrientationEntity.status
        }
    }
    
    // Deletes a OrientationEntity
    func delete(id: NSManagedObjectID){
        if let orientationToDelete = getById(id: id) {
            context.delete(orientationToDelete)
        }
    }
    
    // Saves all changes
    func saveChanges(){
        do {
            try context.save()
        } catch let error as NSError {
            print(error)
        }
    }
}
