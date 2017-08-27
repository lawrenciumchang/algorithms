//
//  PermutationsDetailViewController.swift
//  Algorithms
//
//  Created by Lawrence Chang on 8/17/17.
//  Copyright © 2017 Lawrencium. All rights reserved.
//

import UIKit
import CoreData

class PermutationsDetailViewController: UIViewController {

    var identifier: Int = 0
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var cubeImage: UIImageView!
    @IBOutlet weak var solutionLabel: UILabel!
    @IBOutlet weak var inProgressBtn: UIButton!
    @IBOutlet weak var completedBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        printAll(identifier: identifier)
        
        // create a function to init permutationsService
        
        // create getStatus function, use its return to set image type
        
        cubeImage.image = UIImage(named: Permutations.dataList[identifier].0)
        solutionLabel.text = Permutations.dataList[identifier].1
        
        inProgressBtn.layer.cornerRadius = 4
        completedBtn.layer.cornerRadius = 4
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(performSegueToReturnBack))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
    }
    
    // don't need this anymore
    func printAll(identifier: Int) {
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "PermutationEntity")
        
        do {
            print("getting fetched results...")
            let fetchedResults = try managedContext.fetch(fetchRequest)
            for item in fetchedResults {
                print(item.value(forKey: "id")!, item.value(forKey: "status")!)
            }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    func updateStatus(identifier: Int) {
        // drop all code in here, then reference function. (will pass in string as parameter)
        
    }
    
    func performSegueToReturnBack()  {
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func inProgressBtnClicked(_ sender: Any) {
        print("in progress btn clicked")
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        
        // Create an instance of the service.
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let permutationsService = PermutationsService(context: managedContext)
        
        let permutations : [PermutationEntity] = permutationsService.getAll()
        if(permutations.count == 0) {
            print("creating since size is 0...")
            _ = permutationsService.create(id: identifier, status: "in-progress")
        }
        else {
            var updated = false
            for (key, permutation) in permutations.enumerated() {
                if(permutation.value(forKey: "id") as? Int == identifier) {
                    print("updating...")
                    let selectedPermutation = permutationsService.getById(id: permutations[key].objectID)!
                    selectedPermutation.status = "in-progress"
                    permutationsService.update(updatedPermutationEntity: selectedPermutation)
                    updated = true
                    break
                }
            }
            if(!updated) {
                print("creating new...")
                _ = permutationsService.create(id: identifier, status: "in-progress")
                print("done creating new. no more!")
            }

        }
        
        // make sure to save everything after
        
    }
    
    @IBAction func completedBtnClicked(_ sender: Any) {
        print("completed btn clicked")
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        
        // Create an instance of the service.
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let permutationsService = PermutationsService(context: managedContext)
        
        let permutations : [PermutationEntity] = permutationsService.getAll()
        if(permutations.count == 0) {
            print("creating since size is 0...")
            _ = permutationsService.create(id: identifier, status: "completed")
        }
        else {
            var updated = false
            for (key, permutation) in permutations.enumerated() {
                if(permutation.value(forKey: "id") as? Int == identifier) {
                    print("updating...")
                    let selectedPermutation = permutationsService.getById(id: permutations[key].objectID)!
                    selectedPermutation.status = "completed"
                    permutationsService.update(updatedPermutationEntity: selectedPermutation)
                    updated = true
                    break
                }
            }
            if(!updated) {
                print("creating new...")
                _ = permutationsService.create(id: identifier, status: "completed")
                print("done creating new. no more!")
            }
            
        }
        
        // make sure to save
        
    }
    
}
