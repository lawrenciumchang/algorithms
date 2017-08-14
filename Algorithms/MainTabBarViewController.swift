//
//  MainTabBarViewController.swift
//  Algorithms
//
//  Created by Lawrence Chang on 8/14/17.
//  Copyright © 2017 Lawrencium. All rights reserved.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var viewControllerArray = Array<UIViewController>()
        
        let timerVC: UIViewController? = UIStoryboard(name: "Timer", bundle: nil).instantiateInitialViewController()
        if timerVC != nil {
            viewControllerArray.append(timerVC!)
        }
        
        let f2lVC: UIViewController? = UIStoryboard(name: "F2L", bundle: nil).instantiateInitialViewController()
        if f2lVC != nil {
            viewControllerArray.append(f2lVC!)
        }
        
        let orientationsVC: UIViewController? = UIStoryboard(name: "Orientations", bundle: nil).instantiateInitialViewController()
        if orientationsVC != nil {
            viewControllerArray.append(orientationsVC!)
        }
        
        let permutationsVC: UIViewController? = UIStoryboard(name: "Permutations", bundle: nil).instantiateInitialViewController()
        if permutationsVC != nil {
            viewControllerArray.append(permutationsVC!)
        }
        
        self.setViewControllers(viewControllerArray, animated: false)
        
        // Default to the Timer tab
        self.setSelectedTab(Constants.TabBarScreens.timer)
    }
    
    func setSelectedTab(_ tabBarScreen: Constants.TabBarScreens) {
        self.selectedIndex = tabBarScreen.rawValue
    }
    
}


