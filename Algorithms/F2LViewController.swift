//
//  F2LViewController.swift
//  Algorithms
//
//  Created by Lawrence Chang on 8/14/17.
//  Copyright © 2017 Lawrencium. All rights reserved.
//

import UIKit

class F2LViewController: UIViewController {
    
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var algorithmsBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        algorithmsBtn.layer.cornerRadius = 4
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(F2LViewController.hapticResponse))
        mainImage.isUserInteractionEnabled = true
        mainImage.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func hapticResponse() {
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
    }
    
    @IBAction func onBtnClick(_ sender: Any) {
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        if let url = URL(string: "http://www.speedcubing.com/f2l_crossbottom.html") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
}
