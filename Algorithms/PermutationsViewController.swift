//
//  PermutationsViewController.swift
//  Algorithms
//
//  Created by Lawrence Chang on 8/14/17.
//  Copyright © 2017 Lawrencium. All rights reserved.
//

import UIKit

class PermutationsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var permutationsTable: UITableView!
    
    var dataList:[(String,String)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataList.append(("p1.gif","R² U F B' R² F' B U R²"))
        dataList.append(("p1b.gif", "R² U' F B' R² F' B U' R²"))
        permutationsTable.delegate = self
        permutationsTable.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataList.count
    }
    
    func tableView(_ permutationsTable: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = permutationsTable.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomTableViewCell
        cell.permutationImage.image = UIImage(named: dataList[indexPath.row].0)
        cell.solutionLabel.text = dataList[indexPath.row].1
        return cell
    }
    
}
