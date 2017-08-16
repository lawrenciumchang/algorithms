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
    @IBOutlet weak var permutationsTable: UITableView!
    
    var dataList:[(String,String)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataList.append(("o1.gif","a) R U2 R2 F R F' U2 R' F R F' \nb) R U2 R2 y' x' (R U R') x y U2 R' y (L' F L')"))
        dataList.append(("o2.gif", "a) F' L' U' L U F B' U' R' U R B \nb) (F') (L' U' L U) (F) (f') (L' U' L U) (f)"))
        
        permutationsTable.delegate = self
        permutationsTable.dataSource = self
        
        permutationsTable.contentInset = UIEdgeInsetsMake(80, 0, 0, 0)
        
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
        return self.dataList.count
    }
    
    func tableView(_ permutationsTable: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = permutationsTable.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomTableViewCell
        cell.cubeImage.image = UIImage(named: dataList[indexPath.row].0)
        cell.solutionLabel.text = dataList[indexPath.row].1
        return cell
    }
    
}
