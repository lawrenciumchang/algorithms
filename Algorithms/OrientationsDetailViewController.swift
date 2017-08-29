//
//  OrientationsDetailViewController.swift
//  Algorithms
//
//  Created by Lawrence Chang on 8/17/17.
//  Copyright © 2017 Lawrencium. All rights reserved.
//

import UIKit

class OrientationsDetailViewController: UIViewController {
    
    var identifier: Int = 0
    
    @IBOutlet weak var cubeImage: UIImageView!
    @IBOutlet weak var solutionLabelA: UILabel!
    @IBOutlet weak var solutionLabelB: UILabel!
    @IBOutlet weak var inProgressBtn: UIButton!
    @IBOutlet weak var completedBtn: UIButton!
    @IBOutlet weak var statusImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStatusImage(status: getStatus())
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(OrientationsDetailViewController.resetStatus))
        statusImage.isUserInteractionEnabled = true
        statusImage.addGestureRecognizer(tapGestureRecognizer)
        
        cubeImage.image = UIImage(named: Orientations.dataList[identifier].0)
        solutionLabelA.text = Orientations.dataList[identifier].2
        solutionLabelB.text = Orientations.dataList[identifier].3
        
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
        let orientationsService = OrientationsService(context: managedContext)
        
        let orientations : [OrientationEntity] = orientationsService.getAll()
        
        if(orientations.count == 0) {
            return "incomplete"
        }
        else {
            for (key, orientation) in orientations.enumerated() {
                if(orientation.value(forKey: "id") as? Int == identifier) {
                    let currentOrientation = orientationsService.getById(id: orientations[key].objectID)!
                    return currentOrientation.status!
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
        let orientationsService = OrientationsService(context: managedContext)
        
        let orientations : [OrientationEntity] = orientationsService.getAll()
        
        if(orientations.count == 0) {
            _ = orientationsService.create(id: identifier, status: newStatus)
        }
        else {
            var updated = false
            for (key, orientation) in orientations.enumerated() {
                if(orientation.value(forKey: "id") as? Int == identifier) {
                    let currentOrientation = orientationsService.getById(id: orientations[key].objectID)!
                    currentOrientation.status = newStatus
                    orientationsService.update(updatedOrientationEntity: currentOrientation)
                    updated = true
                    break
                }
            }
            if(!updated) {
                _ = orientationsService.create(id: identifier, status: newStatus)
            }
            
        }
        
        orientationsService.saveChanges()
    }
    
    func performSegueToReturnBack()  {
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func resetStatus() {
        if(getStatus() != "incomplete") {
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
            updateStatus(newStatus: "incomplete")
            setStatusImage(status: "incomplete")
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
