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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cubeImage.image = UIImage(named: Orientations.dataList[identifier].0)
        solutionLabelA.text = Orientations.dataList[identifier].2
        solutionLabelB.text = Orientations.dataList[identifier].3
        
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
    
}
