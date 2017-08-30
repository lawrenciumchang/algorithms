//
//  PermutationsViewController.swift
//  Algorithms
//
//  Created by Lawrence Chang on 8/14/17.
//  Copyright © 2017 Lawrencium. All rights reserved.
//

import UIKit
import CoreData

class PermutationsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var permutationsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        permutationsTable.delegate = self
        permutationsTable.dataSource = self
        
        permutationsTable.contentInset = UIEdgeInsetsMake(92, 0, 0, 0)
        
        let blurEffect = UIBlurEffect(style: .regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = titleView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        titleView.backgroundColor = UIColor.clear
        titleView.addSubview(blurEffectView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        permutationsTable.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Permutations.count
    }
    
    func tableView(_ permutationsTable: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let position = indexPath.row
        let cell = permutationsTable.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomTableViewCell
    
        
        cell.cubeImage.image = UIImage(named: Permutations.dataList[position].0)
        cell.solutionLabel.text = Permutations.dataList[position].1
        
        let status = getStatus(position: position)
        if(status == "in-progress") {
            cell.statusIcon.image = #imageLiteral(resourceName: "In-Progress-Icon")
        }
        else if(status == "completed") {
            cell.statusIcon.image = #imageLiteral(resourceName: "Completed-Icon")
        }
        else {
            cell.statusIcon.image = nil
        }
        
        return cell
    }
    
    func tableView(_ permutationsTable: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "ShowPermutationsDetail", sender: self)
    }
    
    func getStatus(position: Int) -> String {
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
                if(permutation.value(forKey: "id") as? Int == position) {
                    let currentPermutation = permutationsService.getById(id: permutations[key].objectID)!
                    return currentPermutation.status!
                }
            }
            return "incomplete"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowPermutationsDetail" ,
            let nextScene = segue.destination as? PermutationsDetailViewController ,
            let indexPath = self.permutationsTable.indexPathForSelectedRow {
                nextScene.identifier = indexPath.row
            }
    }
    
}
