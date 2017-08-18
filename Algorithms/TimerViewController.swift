//
//  TimerViewController.swift
//  Algorithms
//
//  Created by Lawrence Chang on 8/14/17.
//  Copyright © 2017 Lawrencium. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    
    
    @IBOutlet weak var labelMinute: UILabel!
    @IBOutlet weak var labelSecond: UILabel!
    @IBOutlet weak var labelMillisecond: UILabel!
    
    @IBOutlet weak var startBtn: UIButton!
    
    @IBOutlet weak var timerBtn1: UIButton!
    @IBOutlet weak var timerBtn2: UIButton!
    
    weak var timer: Timer?
    var startTime: Double = 0
    var time: Double = 0
    var elapsed: Double = 0
    var status: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerBtn1.layer.cornerRadius = 4
        timerBtn2.layer.cornerRadius = 4
    }
    
    @IBAction func toggleStartStop(_ sender: UIButton) {
        if (status) {
            stop()
            sender.setTitle("Start", for: .normal)
        } else {
            reset()
            start()
            sender.setTitle("Stop", for: .normal)
        }
    }
    
    func start() {
        startTime = Date().timeIntervalSinceReferenceDate - elapsed
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        // Set Start/Stop button to true
        status = true
    }
    
    func stop() {
        elapsed = Date().timeIntervalSinceReferenceDate - startTime
        timer?.invalidate()
        // Set Start/Stop button to false
        status = false
    }
    
    func reset() {
        timer?.invalidate()
        startTime = 0
        time = 0
        elapsed = 0
        status = false
        let strReset = String("00")
        labelMinute.text = strReset
        labelSecond.text = strReset
        labelMillisecond.text = strReset
    }
    
    func updateCounter() {
        // Calculate total time since timer started in seconds
        time = Date().timeIntervalSinceReferenceDate - startTime
        // Calculate minutes
        let minutes = UInt8(time / 60.0)
        time -= (TimeInterval(minutes) * 60)
        // Calculate seconds
        let seconds = UInt8(time)
        time -= TimeInterval(seconds)
        // Calculate milliseconds
        let milliseconds = UInt8(time * 100)
        // Format time vars with leading zero
        let strMinutes = String(format: "%02d", minutes)
        let strSeconds = String(format: "%02d", seconds)
        let strMilliseconds = String(format: "%02d", milliseconds)
        // Add time vars to relevant labels
        labelMinute.text = strMinutes
        labelSecond.text = strSeconds
        labelMillisecond.text = strMilliseconds
    }
    
    func getColorByHex(rgbHexValue:UInt32, alpha:Double = 1.0) -> UIColor {
        let red = Double((rgbHexValue & 0xFF0000) >> 16) / 256.0
        let green = Double((rgbHexValue & 0xFF00) >> 8) / 256.0
        let blue = Double((rgbHexValue & 0xFF)) / 256.0
        
        return UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(alpha))
    }
    
    @IBAction func timerBtn1Touched(_ sender: UIButton) {
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        timerBtn1.backgroundColor = getColorByHex(rgbHexValue: 0x6375e5, alpha: 1)
    }
    
    @IBAction func timerBtn1Released(_ sender: UIButton) {
        timerBtn1.backgroundColor = getColorByHex(rgbHexValue: 0x6E82FF, alpha: 1)
    }
    
    @IBAction func timerBtn2Touched(_ sender: UIButton) {
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        timerBtn2.backgroundColor = getColorByHex(rgbHexValue: 0x6375e5, alpha: 1)
    }
    
    @IBAction func timerBtn2Released(_ sender: UIButton) {
        timerBtn2.backgroundColor = getColorByHex(rgbHexValue: 0x6E82FF, alpha: 1)
    }
    
}
