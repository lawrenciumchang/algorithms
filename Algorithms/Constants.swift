//
//  Constants.swift
//  Algorithms
//
//  Created by Lawrence Chang on 8/14/17.
//  Copyright © 2017 Lawrencium. All rights reserved.
//

import Foundation

class Constants {
    
    enum TabBarScreens: Int {
        case timer = 0
        case f2l = 1
        case orientations = 2
        case permutations = 3
    }
    
    enum TouchActions: String {
        case timer = "timer"
        case f2l = "f2l"
        case orientations = "orientations"
        case permutations = "permutations"
        
        var number: Int {
            switch  self {
                case .timer:
                    return TabBarScreens.timer.rawValue
                case .f2l:
                    return TabBarScreens.f2l.rawValue
                case .orientations:
                    return TabBarScreens.orientations.rawValue
                case .permutations:
                    return TabBarScreens.permutations.rawValue
            }
        }
    }
    
}
