//
//  Permutations.swift
//  Algorithms
//
//  Created by Lawrence Chang on 8/17/17.
//  Copyright © 2017 Lawrencium. All rights reserved.
//

import Foundation

class Permutations {
    
    static var count: Int {
        return self.dataList.count
    }
    
    static var dataList:[(String, String)] = [
        (
            "p1.gif",
            "R² U F B' R² F' B U R²"
        ),
        (
            "p1b.gif",
            "R² U' F B' R² F' B U' R²"
        ),
        (   "p2.gif", 
            "(R² B²) (R F R') (B² R F' R)"
        ),
        (   "p2b.gif", 
            "(R' F R') B² (R F' R') (B² R²)"
        ),
        (   "p3.gif", 
            "((R B') (R' B)) (F R' F B') \n(R' B R) (F² U)"
        ),
        (   "p4.gif", 
            "R² (B² F²) (L² D') \nR² (B² F²) (L² U)"
        ),
        (   "p5.gif", 
            "(F R' F') L (F R F') (L² B') \n(R B) (L B') (R' B)"
        ),
        (   "p6.gif", 
            "(U' L²) (D F²) (D' L²) \nB² (D' R²) (D B²)"
        ),
        (   "p6.gif", 
            "(R' U R' U') (B' D B' D' B²) \n(R' B' R B R)"
        ),
        (   "p7.gif", 
            "(L² F' L) D² (R' B R) D² \nL B (L F L' B')"
        ),
        (   "p8.gif", 
            "U' B' U² B U' (R' F R) \nB' (R' F' R) (U' B)"
        ),
        (   "p9.gif", 
            "B² (L U L') B² (R D' R D R²)"
        ),
        (   "p10.gif", 
            "R B U' (B' R D) B' \n(L' B' L) B² (D' R²)"
        ),
        (   "p11.gif", 
            "(F U F') L² D' \n((B U') (B' U B')) (D L²)"
        ),
        (   "p12.gif", 
            "L² D' (B U' B U B') \n(D L²) (F U' F')"
        ),
        (   "p13.gif", 
            "(R U' R2) (F2 U' R F2 R') \n(U F2) (R2 U R') (U')"
        )
    ]

}
