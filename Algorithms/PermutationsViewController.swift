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
    
    var dataList:[(String,String)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataList.append(("p1.gif","R² U F B' R² F' B U R²"))
        dataList.append(("p1b.gif", "R² U' F B' R² F' B U' R²"))
        dataList.append(("p2.gif", "(R² B²) (R F R') (B² R F' R)"))
        dataList.append(("p2b.gif", "(R' F R') B² (R F' R') (B² R²)"))
        dataList.append(("p3.gif", "((R B') (R' B)) (F R' F B') \n(R' B R) (F² U)"))
        dataList.append(("p4.gif", "R² (B² F²) (L² D') \nR² (B² F²) (L² U)"))
        dataList.append(("p5.gif", "(F R' F') L (F R F') (L² B') \n(R B) (L B') (R' B)"))
        dataList.append(("p6.gif", "(U' L²) (D F²) (D' L²) \nB² (D' R²) (D B²)"))
        dataList.append(("p6.gif", "(R' U R' U') (B' D B' D' B²) \n(R' B' R B R)"))
        dataList.append(("p7.gif", "(L² F' L) D² (R' B R) D² \nL B (L F L' B')"))
        dataList.append(("p8.gif", "U' B' U² B U' (R' F R) \nB' (R' F' R) (U' B)"))
        dataList.append(("p9.gif", "B² (L U L') B² (R D' R D R²)"))
        dataList.append(("p10.gif", "R B U' (B' R D) B' \n(L' B' L) B² (D' R²)"))
        dataList.append(("p11.gif", "(F U F') L² D' \n((B U') (B' U B')) (D L²)"))
        dataList.append(("p12.gif", "L² D' (B U' B U B') \n(D L²) (F U' F')"))
        dataList.append(("p13.gif", "(R U' R2) (F2 U' R F2 R') \n(U F2) (R2 U R') (U')"))
        
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
        return self.dataList.count
    }
    
    func tableView(_ permutationsTable: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = permutationsTable.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomTableViewCell
        cell.permutationImage.image = UIImage(named: dataList[indexPath.row].0)
        cell.solutionLabel.text = dataList[indexPath.row].1
        return cell
    }
    
}
