//
//  PermutationsService.swift
//  Algorithms
//
//  Created by Lawrence Chang on 8/27/17.
//  Copyright © 2017 Lawrencium. All rights reserved.
//

import CoreData

class PermutationsService{
    
    var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext){
        self.context = context
    }
    
    // Creates a new PermutationEntity
    func create(id: Int, status: String) -> PermutationEntity {
        let newItem = NSEntityDescription.insertNewObject(forEntityName: "PermutationEntity", into: context) as! PermutationEntity
        newItem.id = Int16(id)
        newItem.status = status
        return newItem
    }
    
    // Gets a PermutationEntity by id
    func getById(id: NSManagedObjectID) -> PermutationEntity? {
        return context.object(with: id) as? PermutationEntity
    }
    
    // Gets all.
    func getAll() -> [PermutationEntity]{
        return get(withPredicate: NSPredicate(value:true))
    }
    
    // Gets all that fulfill the specified predicate.
    func get(withPredicate queryPredicate: NSPredicate) -> [PermutationEntity] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "PermutationEntity")
        fetchRequest.predicate = queryPredicate
        do {
            let response = try context.fetch(fetchRequest)
            return response as! [PermutationEntity]
        } catch let error as NSError {
            print(error)
            return [PermutationEntity]()
        }
    }
    
    // Updates a PermutationEntity
    func update(updatedPermutationEntity: PermutationEntity) {
        if let permutation = getById(id: updatedPermutationEntity.objectID) {
            permutation.id = updatedPermutationEntity.id
            permutation.status = updatedPermutationEntity.status
        }
    }
    
    // Deletes a PermutationEntity
    func delete(id: NSManagedObjectID){
        if let permutationToDelete = getById(id: id) {
            context.delete(permutationToDelete)
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
