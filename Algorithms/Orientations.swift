//
//  Orientations.swift
//  Algorithms
//
//  Created by Lawrence Chang on 8/17/17.
//  Copyright © 2017 Lawrencium. All rights reserved.
//

import Foundation

class Orientations {
    
    static var count: Int {
        return self.dataList.count
    }
    
    static var dataList:[(String, String, String, String)] = [
        (
            "o1.gif",
            "a) R U2 R2 F R F' U2 R' F R F' \nb) R U2 R2 y' x' (R U R') x y U2 R' y (L' F L')",
            "R U2 R2 F R F' U2 R' F R F'",
            "R U2 R2 y' x' (R U R') x y U2 R' y (L' F L')"
        ),
        (
            "o2.gif",
            "a) F' L' U' L U F B' U' R' U R B \nb) (F') (L' U' L U) (F) (f') (L' U' L U) (f)",
            "F' L' U' L U F B' U' R' U R B",
            "(F') (L' U' L U) (F) (f') (L' U' L U) (f)"
        ),
        (
            "o3.gif",
            "a) R' U2 R' F R F' U' F' U' F U' R \nb) R' U2 R' y (L F L') (U') (L' U' L U') y L",
            "R' U2 R' F R F' U' F' U' F U' R",
            "R' U2 R' y (L F L') (U') (L' U' L U') y L"
        ),
        (
            "o3-2.gif",
            "a) L U2 L F' L' F U F U F' U L' \nb) L U2 L y' (R' F' R) (U) (R U R' U) y L'",
            "L U2 L F' L' F U F U F' U L'",
            "L U2 L y' (R' F' R) (U) (R U R' U) y L'"
        ),
        (
            "o4.gif",
            "a) R' F R F' U' L R' D' F D R L' \nb) x (R' U) (R U') x' (U' L) R' y' (D' R) u L' R",
            "R' F R F' U' L R' D' F D R L'",
            "x (R' U) (R U') x' (U' L) R' y' (D' R) u L' R"
        ),
        (
            "o5.gif",
            "a) F R U R' U F' U2 F' L F L' \nb) (F) (R U R' U) y' (R' U2) R' y (L F L')",
            "F R U R' U F' U2 F' L F L'",
            "(F) (R U R' U) y' (R' U2) R' y (L F L')"
        ),
        (
            "o6.gif",
            "a) L U2 F' L' U' L U F2 U2 F' L' \nb) (L U2) (F') (L' U' L U) y' (R2 U2) (R' F')",
            "L U2 F' L' U' L U F2 U2 F' L'",
            "(L U2) (F') (L' U' L U) y' (R2 U2) (R' F')"
        ),
        (
            "o7.gif",
            "a) M F' U' F U F U F U' F' M' \nb) M y' (R' U' R U) (R U) (R U' R') S'",
            "M F' U' F U F U F U' F' M'",
            "M y' (R' U' R U) (R U) (R U' R') S'"
        ),
        (
            "o8.gif",
            "a) L U2 L2 U' L U' L' U2 B L B' \nb) (L U2) (L2 U') (L U') (L' U2) y' (L F L')",
            "L U2 L2 U' L U' L' U2 B L B'",
            "(L U2) (L2 U') (L U') (L' U2) y' (L F L')"
        ),
        (
            "o9.gif",
            "a) L' B' L U' R' U R U' R' U R L' B L \nb) x' (L' U' r U') (R' U) (R U') (R' U R) x' (L' U L) x",
            "L' B' L U' R' U R U' R' U R L' B L",
            "x' (L' U' r U') (R' U) (R U') (R' U R) x' (L' U L) x"
        ),
        (
            "o10.gif",
            "Aa) L U F U' F' U F U' F' L' \nAb) (L d) (R U') (R' U) (R U' R') y L' \nBa) R' U' F' U F U' F' U F R \nBb) (R' d') (L' U) (L U') (L' U L) y' R",
            "a) L U F U' F' U F U' F' L' \nb) (L d) (R U') (R' U) (R U' R') y L'",
            "b) R' U' F' U F U' F' U F R \nb) (R' d') (L' U) (L U') (L' U L) y' R"
        ),
        (
            "o11.gif",
            "a) R' U' F' U F' L F L' F R \nb) R' d' L' d F' x (L U L' U l)",
            "R' U' F' U F' L F L' F R",
            "R' d' L' d F' x (L U L' U l)"
        ),
        (
            "o11-2.gif",
            "a) L U F U' F R' F' R F' L' \nb) L d R d' F x (R' U' R U' r')",
            "L U F U' F R' F' R F' L'",
            "L d R d' F x (R' U' R U' r')"
        ),
        (
            "o12.gif",
            "a) R B L' B L B' L' B L B2 R' \nb) x' R U (L' U) (L U') (L' U L) U2 R' x",
            "R B L' B L B' L' B L B2 R'",
            "x' R U (L' U) (L U') (L' U L) U2 R' x"
        ),
        (
            "o12-2.gif",
            "a) L' B' R B' R' B R B' R' B2 L \nb) x' L' U' (R U') (R' U) (R U' R') U2 L x",
            "L' B' R B' R' B R B' R' B2 L",
            "x' L' U' (R U') (R' U) (R U' R') U2 L x"
        ),
        (
            "o13.gif",
            "a) R F' U2 F U2 F R2 F' R \nb) (R F') (U2 y) L (U2 y') F R2 F' R",
            "R F' U2 F U2 F R2 F' R",
            "(R F') (U2 y) L (U2 y') F R2 F' R"
        ),
        (
            "o13-2.gif",
            "a) L' F U2 F' U2 F' L2 F L' \nb) (L' F) (U2 y') R' (U2 y) F' L2 F L'",
            "L' F U2 F' U2 F' L2 F L'",
            "(L' F) (U2 y') R' (U2 y) F' L2 F L'"
        ),
        (
            "o14.gif",
            "a) R B U B' U' B U B' U' R' \nb) x' (R d) (R U') (R' U) (R U' R') y x R'",
            "R B U B' U' B U B' U' R'",
            "x' (R d) (R U') (R' U) (R U' R') y x R'"
        ),
        (
            "o14-2.gif",
            "a) L' B' U' B U B' U' B U L \nb) x' (L' d') (L' U) (L U') (L' U L) y' x L",
            "L' B' U' B U B' U' B U L",
            "x' (L' d') (L' U) (L U') (L' U L) y' x L"
        ),
        (
            "o15.gif",
            "a) R B L' B L B2 R' \nb) x' R (U L' U) (L U2) x R'",
            "R B L' B L B2 R'",
            "x' R (U L' U) (L U2) x R'"
        ),
        (
            "o15-2.gif",
            "a) L' B' R B' R' B2 L \nb) x' L' (U' R U') (R' U2) x L",
            "L' B' R B' R' B2 L",
            "x' L' (U' R U') (R' U2) x L"
        ),
        (
            "o15-3.gif",
            "a) L F2 R' F' R F' L' \nb) r (U R' U) (R U2) r'",
            "L F2 R' F' R F' L'",
            "r (U R' U) (R U2) r'"
        ),
        (
            "o15-4.gif",
            "a) R' F2 L F L' F R \nb) l' (U' L U') (L' U2) l",
            "R' F2 L F L' F R",
            "l' (U' L U') (L' U2) l"
        ),
        (
            "o16.gif",
            "a) R L2 B' L B' L' B2 L B' L R' \nb) x' R (L2 U' L U') (L' U2) (L U' r) R'",
            "R L2 B' L B' L' B2 L B' L R'",
            "x' R (L2 U' L U') (L' U2) (L U' r) R'"
        ),
        (
            "o16-2.gif",
            "a) L' R2 B R' B R B2 R' B R' L \nb) x' L' (R2 U R' U) (R U2) (R' U l') L",
            "L' R2 B R' B R B2 R' B R' L",
            "x' L' (R2 U R' U) (R U2) (R' U l') L"
        ),
        (
            "o17.gif",
            "a) L' U' L B L' B' U B L B' \nb) (L' U' L) y' (L F') (L' U) x (L U L') x'",
            "L' U' L B L' B' U B L B'",
            "(L' U' L) y' (L F') (L' U) x (L U L') x'"
        ),
        (
            "o17-2.gif",
            "a) R U R' B' R B U' B' R' B \nb) (R U R') y (R' F) (R U') x (R' U' R) x'",
            "R U R' B' R B U' B' R' B",
            "(R U R') y (R' F) (R U') x (R' U' R) x'"
        ),
        (
            "o17-3.gif",
            "a) L U L' F' L F U' F' L' F \nb) (L U L') y' (R' F) (R U') (R' F' R)",
            "L U L' F' L F U' F' L' F",
            "(L U L') y' (R' F) (R U') (R' F' R)"
        ),
        (
            "o17-4.gif",
            "a) R' U' R F R' F' U F R F' \nb) (R' U' R) y (L F') (L' U) (L F L')",
            "R' U' R F R' F' U F R F'",
            "(R' U' R) y (L F') (L' U) (L F L')"
        ),
        (
            "o18.gif",
            "a) L' B2 R B R' B L \nb) x' L' (U)2 (R U R') U L x",
            "L' B2 R B R' B L",
            "x' L' (U)2 (R U R') U L x"
        ),
        (
            "o18-2.gif",
            "a) R B2 L' B' L B' R' \nb) x' R (U')2 (L' U' L) U' R' x",
            "R B2 L' B' L B' R'",
            "x' R (U')2 (L' U' L) U' R' x"
        ),
        (
            "o18-3.gif",
            "a) L F2 R' F' R F' L' \nb) L F2 (R' F' R F' L')",
            "L F2 R' F' R F' L'",
            "L F2 (R' F' R F' L')"
        ),
        (
            "o18-4.gif",
            "a) R' F2 L F L' F R \nb) R' F2 (L F L' F R)",
            "R' F2 L F L' F R",
            "R' F2 (L F L' F R)"
        ),
        (
            "o19.gif",
            "a) R B' R' U' R B R' B' U B \nb) x' (R U' R') F' (R U R') x y (R' U R)",
            "R B' R' U' R B R' B' U B",
            "x' (R U' R') F' (R U R') x y (R' U R)"
        ),
        (
            "o19-2.gif",
            "a) L' B L U L' B' L B U' B' \nb) x' (L' U L) F (L' U' L) x y' (L U' L')",
            "L' B L U L' B' L B U' B'",
            "x' (L' U L) F (L' U' L) x y' (L U' L')"
        ),
        (
            "o19-3.gif",
            "a) R' F R U R' F' R F U' F' \nb) [(R' F) (R U R')] (F' R) y (L U' L')",
            "R' F R U R' F' R F U' F'",
            "[(R' F) (R U R')] (F' R) y (L U' L')"
        ),
        (
            "o19-4.gif",
            "a) L F' L' U' L F L' F' U F \nb) [(L F') (L' U' L)] (F L') y' (R' U R)",
            "L F' L' U' L F L' F' U F",
            "[(L F') (L' U' L)] (F L') y' (R' U R)"
        ),
        (
            "o20.gif",
            "a) L F L' R U R' U' L F' L' \nb) L F L' (R U R') (U') (L F' L')",
            "L F L' R U R' U' L F' L'",
            "L F L' (R U R') (U') (L F' L')"
        ),
        (
            "o20-2.gif",
            "a) R' F' R L' U' L U R' F R \nb) R' F' R (L' U' L) (U) (R' F R)",
            "R' F' R L' U' L U R' F R",
            "R' F' R (L' U' L) (U) (R' F R)"
        ),
        (
            "o20-3.gif",
            "a) R B R' L U L' U' R B' R' \nb) x' (R U R') x (L U L') (U') x' (R U' R') x",
            "R B R' L U L' U' R B' R'",
            "x' (R U R') x (L U L') (U') x' (R U' R') x"
        ),
        (
            "o20-4.gif", 
            "a) L' B' L R' U' R U L' B L \nb) x' (L' U' L) x (R' U' R) (U) x' (L' U L) x",
            "L' B' L R' U' R U L' B L",
            "x' (L' U' L) x (R' U' R) (U) x' (L' U L) x"
        ),
        (
            "o21.gif",
            "a) R L2 D' B' D B L B' L R' \n b) l L2 y (R' U' R U) y' (L U' r) R'",
            "R L2 D' B' D B L B' L R'",
            "l L2 y (R' U' R U) y' (L U' r) R'"
        ),
        (
            "o21-2.gif",
            "a) L' R2 D B D' B' R' B R' L \nb) r' R2 y' (L U L' U') y (R' U l') L",
            "L' R2 D B D' B' R' B R' L",
            "r' R2 y' (L U L' U') y (R' U l') L"
        ),
        (
            "o21-3.gif",
            "a) L R2 D' F' D F R F' R L' \nb) L R2 z' x (R' U' R U) y' (L U' r) R'",
            "L R2 D' F' D F R F' R L'",
            "L R2 z' x (R' U' R U) y' (L U' r) R'"
        ),
        (
            "o21-4.gif",
            "a) R' L2 D F D' F' L' F L' R \nb) R' L2 z x (L' U L U') y (R' U l') L",
            "R' L2 D F D' F' L' F L' R",
            "R' L2 z x (L' U L U') y (R' U l') L"
        ),
        (
            "o22.gif",
            "a) B U L U' F L' B' L F' L' \nb) x' U x U L U' F x' (L' U' L) D' x L'",
            "B U L U' F L' B' L F' L'",
            "x' U x U L U' F x' (L' U' L) D' x L'"
        ),
        (
            "o22-2.gif",
            "a) B' U' R' U F' R B R' F R \nb) x' U' x U' R' U F' x' (R U R') D x R",
            "B' U' R' U F' R B R' F R",
            "x' U' x U' R' U F' x' (R U R') D x R"
        ),
        (
            "o22-3.gif",
            "a) L F' L' F L' U2 L U F U F' \nb) x (L U') (L' U) x' (L' U2) L d (R U R')",
            "L F' L' F L' U2 L U F U F'",
            "x (L U') (L' U) x' (L' U2) L d (R U R')"
        ),
        (
            "o22-4.gif",
            "a) R' F R F' R U2 R' U' F' U' F \nb) x (R' U) (R U') x' (R U2) R' d' (L' U' L)",
            "R' F R F' R U2 R' U' F' U' F",
            "x (R' U) (R U') x' (R U2) R' d' (L' U' L)"
        ),
        (
            "o23.gif",
            "a) L U F' U' L' U L F L' \nb) L d R' d' (L' U) (L F L')",
            "L U F' U' L' U L F L'",
            "L d R' d' (L' U) (L F L')"
        ),
        (
            "o23-2.gif",
            "a) R' U' F U R U' R' F' R \nb) R' d' L d (R U') (R' F' R)",
            "R' U' F U R U' R' F' R",
            "R' d' L d (R U') (R' F' R)"
        ),
        (
            "o23-3.gif",
            "a) R U B' U' R' U R B R' \nb) (R U) B' (U') (R' U) (l U l')",
            "R U B' U' R' U R B R'",
            "(R U) B' (U') (R' U) (l U l')"
        ),
        (
            "o23-4.gif",
            "a) L' U' B U L U' L' B' L \nb) (L' U') B (U) (L U') (r' U' r)",
            "L' U' B U L U' L' B' L",
            "(L' U') B (U) (L U') (r' U' r)"
        ),
        (
            "o24.gif",
            "a) B L' B' L U L U' L' \nb) x' U (L' U' L) x (U) (L U' L')",
            "B L' B' L U L U' L'",
            "x' U (L' U' L) x (U) (L U' L')"
        ),
        (
            "o25.gif",
            "a) F' U' L' U L F \nb) (F') (U') (L' U L) (F)",
            "F' U' L' U L F",
            "(F') (U') (L' U L) (F)"
        ),
        (
            "o25-2.gif",
            "a) F U R U' R' F' \nb) (F) (U) (R U' R') (F')",
            "F U R U' R' F'",
            "(F) (U) (R U' R') (F')"
        ),
        (
            "o25-new1.gif",
            "a) B' U' R' U R B \nb) (f') (L' U' L U) (f)",
            "B' U' R' U R B",
            "(f') (L' U' L U) (f)"
        ),
        (
            "o25-new2.gif",
            "a) B U L U' L' B' \nb) (f) (R U R' U') (f')",
            "B U L U' L' B'",
            "(f) (R U R' U') (f')"
        ),
        (
            "o26.gif",
            "a) R' U2 R2 B' R' B R' U2 R \nb) (R' U2 R) x' (R U') (R' U) x (R' U2 R)",
            "R' U2 R2 B' R' B R' U2 R",
            "(R' U2 R) x' (R U') (R' U) x (R' U2 R)"
        ),
        (
            "o26-2.gif",
            "a) L U2 L2 B L B' L U2 L' \nb) (L U2 L') x' (L' U) (L U') x (L U2 L')",
            "L U2 L2 B L B' L U2 L'",
            "(L U2 L') x' (L' U) (L U') x (L U2 L')"
        ),
        (
            "o26-3.gif",
            "a) R U2 R2 F R F' R U2 R' \nb) (R U2) (R2 F) (R F') (R U2) R'",
            "R U2 R2 F R F' R U2 R'",
            "(R U2) (R2 F) (R F') (R U2) R'"
        ),
        (
            "o26-4.gif",
            "a) L' U2 L2 F' L' F L' U2 L \nb) (L' U2) (L2 F') (L' F) (L' U2) L",
            "L' U2 L2 F' L' F L' U2 L",
            "(L' U2) (L2 F') (L' F) (L' U2) L"
        ),
        (
            "o27.gif",
            "a) F' L' U' L U F \nb) F' (L' U' L U) F",
            "F' L' U' L U F",
            "F' (L' U' L U) F"
        ),
        (
            "o27-2.gif",
            "a) F R U R' U' F' \nb) F (R U R' U') F'",
            "F R U R' U' F'",
            "F (R U R' U') F'"
        ),
        (
            "o28.gif",
            "a) L' U' L U L F' L' F \nb) (L' U' L U) (L F') L' F",
            "L' U' L U L F' L' F",
            "(L' U' L U) (L F') L' F"
        ),
        (
            "o28-2.gif",
            "a) R U R' U' R' F R F' \nb) (R U R' U') (R' F) R F'",
            "R U R' U' R' F R F'",
            "(R U R' U') (R' F) R F'"
        ),
        (
            "o29.gif",
            "a) R B' R' U' R U B U' R' \nb) x' (R U' R') F' R y (L U L') y' l'",
            "R B' R' U' R U B U' R'",
            "x' (R U' R') F' R y (L U L') y' l'"
        ),
        (
            "o29-2.gif",
            "a) L' B L U L' U' B' U L \nb) x' (L' U L) F L' y' (R' U' R) y r",
            "L' B L U L' U' B' U L",
            "x' (L' U L) F L' y' (R' U' R) y r"
        ),
        (
            "o29-3.gif",
            "a) L F' L' U' L U F U' L' \nb) (L F' L' U' L U) F U' L'",
            "L F' L' U' L U F U' L'",
            "(L F' L' U' L U) F U' L'"
        ),
        (
            "o29-4.gif",
            "a) R' F R U R' U' F' U R \nb) (R' F R U R' U') (F' U) R",
            "R' F R U R' U' F' U R",
            "(R' F R U R' U') (F' U) R"
        ),
        (
            "o30.gif",
            "a) L U L' U' F' L' B L F B' \nb) (L U L') (U') y' l' U' (L U L') l",
            "L U L' U' F' L' B L F B'",
            "(L U L') (U') y' l' U' (L U L') l"
        ),
        (
            "o30-2.gif",
            "a) R U R' U' B' R' F R B F' \nb) (R U R' U') y l' U' (L U L') l",
            "R U R' U' B' R' F R B F'",
            "(R U R' U') y l' U' (L U L') l"
        ),
        (
            "o31.gif",
            "a) R B U' L U L' B' R' \nb) l d R' y (r U r') (U') l'",
            "R B U' L U L' B' R'",
            "l d R' y (r U r') (U') l'"
        ),
        (
            "o31-2.gif",
            "a) L' B' U R' U' R B L \nb) r' d' L y' (l' U' l) (U) r",
            "L' B' U R' U' R B L",
            "r' d' L y' (l' U' l) (U) r"
        ),
        (
            "o32.gif",
            "a) B L U L2 U' B' U B L B' \nb) (B) (L U L2) y' U' (L' U) x (L U L') x'",
            "B L U L2 U' B' U B L B'",
            "(B) (L U L2) y' U' (L' U) x (L U L') x'"
        ),
        (
            "o32-2.gif",
            "a) B' R' U' R2 U B U' B' R' B \nb) (B') (R' U' R2) y U (R U') x (R' U' R) x'",
            "B' R' U' R2 U B U' B' R' B",
            "(B') (R' U' R2) y U (R U') x (R' U' R) x'"
        ),
        (
            "o32-3.gif",
            "a) F R U R2 U' F' U F R F' \nb) (F) (R U (R')2 U') y (L' U) x (L U L')",
            "F R U R2 U' F' U F R F'",
            "(F) (R U (R')2 U') y (L' U) x (L U L')"
        ),
        (
            "o32-4.gif",
            "a) F' L' U' L2 U F U' F' L' F \nb) (F') (L' U' (L)2 U) y' (R U') x (R' U' R)",
            "F' L' U' L2 U F U' F' L' F",
            "(F') (L' U' (L)2 U) y' (R U') x (R' U' R)"
        ),
        (
            "o33.gif",
            "a) L' U' L U' L' U L U' L' U2 L \nb) (L' U' L U') (L' U) (L U') (L' U) (U) L",
            "L' U' L U' L' U L U' L' U2 L",
            "(L' U' L U') (L' U) (L U') (L' U) (U) L"
        ),
        (
            "o33-2.gif",
            "a) L' U2 L U L' U' L U L' U L \nb) (L' U) (U) (L U L') (U' L) (U) (L' U L)",
            "L' U2 L U L' U' L U L' U L",
            "(L' U) (U) (L U L') (U' L) (U) (L' U L)"
        ),
        (
            "o34.gif",
            "a) R' U L U' R U' L' U' L U' L' \nb) R' U L U' R U' (L' U' L U') L'",
            "R' U L U' R U' L' U' L U' L'",
            "R' U L U' R U' (L' U' L U') L'"
        ),
        (
            "o34-2.gif",
            "a) a) L U' R' U L' U R U R' U R \nb) L U' R' U L' U (R U R' U) R",
            "a) L U' R' U L' U R U R' U R",
            "L U' R' U L' U (R U R' U) R"
        ),
        (
            "o35.gif",
            "a) R2 D' L F2 L' D R U2 R \nb) (R2 D') (L F2 L') (D) (R U2 R)",
            "R2 D' L F2 L' D R U2 R",
            "(R2 D') (L F2 L') (D) (R U2 R)"
        ),
        (
            "o36.gif",
            "a) R' F' L F R F' L' F \nb) l' U' (L U) l y' (l' U' l)",
            "R' F' L F R F' L' F",
            "l' U' (L U) l y' (l' U' l)"
        ),
        (
            "o36-2.gif",
            "a) L F R' F' L' F R F' \nb) r U (R' U') r' y (r U r')",
            "L F R' F' L' F R F'",
            "r U (R' U') r' y (r U r')"
        ),
        (
            "o37.gif",
            "a) L' B L F' L' B' L F \nb) x' (L' U L) D' (L' U' L) D x",
            "L' B L F' L' B' L F",
            "x' (L' U L) D' (L' U' L) D x"
        ),
        (
            "o37-2.gif",
            "a) R B' R' F R B R' F' \nb) x' (R U' R') D (R U R') D' x",
            "R B' R' F R B R' F'",
            "x' (R U' R') D (R U R') D' x"
        ),
        (
            "o38.gif",
            "a) L U2 L' U' L U' L' \nb) L U2 (L' U' L U' L')",
            "L U2 L' U' L U' L'",
            "L U2 (L' U' L U' L')"
        ),
        (
            "o38-2-1.gif",
            "a) R' U2 R U R' U R \nb) R' U2 (R U R' U R)",
            "R' U2 R U R' U R",
            "R' U2 (R U R' U R)"
        ),
        (
            "o38-2.gif",
            "a) R' U' R U' R' U2 R \nb) (R' U' R U') (R' U2 R)",
            "R' U' R U' R' U2 R",
            "(R' U' R U') (R' U2 R)"
        ),
        (
            "o38-2-2.gif",
            "a) L U L' U L U2 L' \nb) (L U L' U) (L U2 L')",
            "L U L' U L U2 L'",
            "(L U L' U) (L U2 L')"
        ),
        (
            "o38-3.gif",
            "a) R U2 R' U' R U' R' \nb) (R U2) (R' U' R U' R')",
            "R U2 R' U' R U' R'",
            "(R U2) (R' U' R U' R')"
        ),
        (
            "o38-2-3.gif",
            "a) L' U2 L U L' U L \nb) (L' U2) (L U L' U L)",
            "L' U2 L U L' U L",
            "(L' U2) (L U L' U L)"
        ),
        (
            "o38-4.gif",
            "a) L' U' L U' L' U2 L \nb) (L' U' L U' L' U2 L)",
            "L' U' L U' L' U2 L",
            "(L' U' L U' L' U2 L)"
        ),
        (
            "o38-2-4.gif",
            "a) R U R' U R U2 R' \nb) (R U R' U R U2 R')",
            "R U R' U R U2 R'",
            "(R U R' U R U2 R')"
        ),
        (
            "o39.gif",
            "a) L F' L F2 R' F R F2 L2 \nb) (r U' L) U2 (R' U R) U2 (L' r')",
            "L F' L F2 R' F R F2 L2",
            "(r U' L) U2 (R' U R) U2 (L' r')"
        ),
        (
            "o39-2.gif",
            "a) R' F R' F2 L F' L' F2 R2 \nb) (l' U R') U2 (L U' L') U2 (R l)",
            "R' F R' F2 L F' L' F2 R2",
            "(l' U R') U2 (L U' L') U2 (R l)"
        ),
        (
            "o40.gif",
            "a) R U R' U' R' L F R F' L' \nb) (R U R' U') M' (U R) U' r'",
            "R U R' U' R' L F R F' L'",
            "(R U R' U') M' (U R) U' r'"
        )
    ]
    
}
