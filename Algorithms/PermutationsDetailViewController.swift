//
//  PermutationsDetailViewController.swift
//  Algorithms
//
//  Created by Lawrence Chang on 8/17/17.
//  Copyright © 2017 Lawrencium. All rights reserved.
//

import UIKit

class PermutationsDetailViewController: UIViewController {

    var identifier: Int = 0
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var cubeImage: UIImageView!
    @IBOutlet weak var solutionLabel: UILabel!
    @IBOutlet weak var inProgressBtn: UIButton!
    @IBOutlet weak var completedBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cubeImage.image = UIImage(named: Permutations.dataList[identifier].0)
        solutionLabel.text = Permutations.dataList[identifier].1
        
        inProgressBtn.layer.cornerRadius = 4
        completedBtn.layer.cornerRadius = 4
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(performSegueToReturnBack))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
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
    }
    
    @IBAction func completedBtnClicked(_ sender: Any) {
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
    }
    
}
