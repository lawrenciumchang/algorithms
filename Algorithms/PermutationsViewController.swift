//
//  PermutationsViewController.swift
//  Algorithms
//
//  Created by Lawrence Chang on 8/14/17.
//  Copyright © 2017 Lawrencium. All rights reserved.
//

import UIKit

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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Permutations.count
    }
    
    func tableView(_ permutationsTable: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = permutationsTable.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomTableViewCell
        cell.cubeImage.image = UIImage(named: Permutations.dataList[indexPath.row].0)
        cell.solutionLabel.text = Permutations.dataList[indexPath.row].1
        return cell
    }
    
    func tableView(_ permutationsTable: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "ShowPermutationsDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowPermutationsDetail" ,
            let nextScene = segue.destination as? PermutationsDetailViewController ,
            let indexPath = self.permutationsTable.indexPathForSelectedRow {
                nextScene.identifier = indexPath.row
            }
    }
    
}
