//
//  PermutationsViewController.swift
//  Algorithms
//
//  Created by Lawrence Chang on 8/14/17.
//  Copyright © 2017 Lawrencium. All rights reserved.
//

import UIKit

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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Orientations.count
    }
    
    func tableView(_ orientationsTable: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = orientationsTable.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomTableViewCell
        cell.cubeImage.image = UIImage(named: Orientations.dataList[indexPath.row].0)
        cell.solutionLabel.text = Orientations.dataList[indexPath.row].1
        return cell
    }
    
    func tableView(_ orientationsTable: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "ShowOrientationsDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowOrientationsDetail" ,
            let nextScene = segue.destination as? OrientationsDetailViewController ,
            let indexPath = self.orientationsTable.indexPathForSelectedRow {
            nextScene.identifier = indexPath.row
        }
    }
    
}
