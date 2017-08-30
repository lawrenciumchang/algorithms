//
//  PermutationsViewController.swift
//  Algorithms
//
//  Created by Lawrence Chang on 8/14/17.
//  Copyright © 2017 Lawrencium. All rights reserved.
//

import UIKit
import CoreData

class OrientationsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var orientationsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        orientationsTable.delegate = self
        orientationsTable.dataSource = self
        
        orientationsTable.contentInset = UIEdgeInsetsMake(80, 0, 0, 0)
        
        let blurEffect = UIBlurEffect(style: .regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = titleView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        titleView.backgroundColor = UIColor.clear
        titleView.addSubview(blurEffectView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        orientationsTable.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Orientations.count
    }
    
    func tableView(_ orientationsTable: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let position = indexPath.row
        let cell = orientationsTable.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomTableViewCell
        
        cell.cubeImage.image = UIImage(named: Orientations.dataList[position].0)
        cell.solutionLabel.text = Orientations.dataList[position].1
        
        let status = getStatus(position: position)
        if(status == "in-progress") {
            cell.statusIcon.image = #imageLiteral(resourceName: "In-Progress-Icon")
        }
        else if(status == "completed") {
            cell.statusIcon.image = #imageLiteral(resourceName: "Completed-Icon")
        }
        else if(status == "incomplete"){
            cell.statusIcon.image = nil
        }
        
        return cell
    }
    
    func tableView(_ orientationsTable: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "ShowOrientationsDetail", sender: self)
    }
    
    func getStatus(position: Int) -> String {
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
                if(orientation.value(forKey: "id") as? Int == position) {
                    let currentOrientation = orientationsService.getById(id: orientations[key].objectID)!
                    return currentOrientation.status!
                }
            }
            return "incomplete"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowOrientationsDetail" ,
            let nextScene = segue.destination as? OrientationsDetailViewController ,
            let indexPath = self.orientationsTable.indexPathForSelectedRow {
            nextScene.identifier = indexPath.row
        }
    }
    
}
