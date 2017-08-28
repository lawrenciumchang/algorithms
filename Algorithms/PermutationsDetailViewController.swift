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
    @IBOutlet weak var statusImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStatusImage(status: getStatus())
        
        cubeImage.image = UIImage(named: Permutations.dataList[identifier].0)
        solutionLabel.text = Permutations.dataList[identifier].1
        
        inProgressBtn.layer.cornerRadius = 4
        completedBtn.layer.cornerRadius = 4
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(performSegueToReturnBack))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
    }
    
    func getStatus() -> String {
        // Create an instance of the service.
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return ""
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let permutationsService = PermutationsService(context: managedContext)
        
        let permutations : [PermutationEntity] = permutationsService.getAll()
        
        if(permutations.count == 0) {
            return "incomplete"
        }
        else {
            for (key, permutation) in permutations.enumerated() {
                if(permutation.value(forKey: "id") as? Int == identifier) {
                    print("found data!...")
                    let currentPermutation = permutationsService.getById(id: permutations[key].objectID)!
                    return currentPermutation.status!
                }
            }
            return "incomplete"
        }
    }
    
    func setStatusImage(status: String) {
        switch status {
            case "incomplete":
                statusImage.image = nil
                break
            case "in-progress":
                statusImage.image = #imageLiteral(resourceName: "In-Progress-Icon")
                break
            case "completed":
                statusImage.image = #imageLiteral(resourceName: "Completed-Icon")
                break
            default:
                statusImage.image = nil
                break
        }
    }
    
    func updateStatus(newStatus: String) {
        // Create an instance of the service.
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let permutationsService = PermutationsService(context: managedContext)
        
        let permutations : [PermutationEntity] = permutationsService.getAll()
        
        if(permutations.count == 0) {
            print("creating since size is 0...")
            _ = permutationsService.create(id: identifier, status: newStatus)
        }
        else {
            var updated = false
            for (key, permutation) in permutations.enumerated() {
                if(permutation.value(forKey: "id") as? Int == identifier) {
                    print("updating...")
                    let currentPermutation = permutationsService.getById(id: permutations[key].objectID)!
                    currentPermutation.status = newStatus
                    permutationsService.update(updatedPermutationEntity: currentPermutation)
                    updated = true
                    break
                }
            }
            if(!updated) {
                print("creating new...")
                _ = permutationsService.create(id: identifier, status: newStatus)
                print("done creating new. no more!")
            }
            
        }
        
        permutationsService.saveChanges()
    }
    
    func performSegueToReturnBack()  {
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func inProgressBtnClicked(_ sender: Any) {
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        updateStatus(newStatus: "in-progress")
        setStatusImage(status: "in-progress")
    }
    
    @IBAction func completedBtnClicked(_ sender: Any) {
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        updateStatus(newStatus: "completed")
        setStatusImage(status: "completed")
    }
    
}
