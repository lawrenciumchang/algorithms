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
    
    @IBOutlet weak var panel1: UIView!
    @IBOutlet weak var panel2: UIView!
    @IBOutlet weak var panel3: UIView!
    
    @IBOutlet weak var timerBtn1: UIButton!
    
    weak var timer: Timer?
    var startTime: Double = 0
    var time: Double = 0
    var elapsed: Double = 0
    var isTimerRunning: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerBtn1.layer.cornerRadius = 4
        panel1.layer.cornerRadius = 4
        panel2.layer.cornerRadius = 4
        panel3.layer.cornerRadius = 4
    }
    
    @IBAction func timerBtn1Released(_ sender: UIButton) {
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        if(isTimerRunning) {
            stopTimer()
            stopAnimation()
        } else {
            resetTimer()
            startTimer()
            startAnimation()
        }
    }
    
    func startTimer() {
        startTime = Date().timeIntervalSinceReferenceDate - elapsed
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        isTimerRunning = true
    }
    
    func stopTimer() {
        elapsed = Date().timeIntervalSinceReferenceDate - startTime
        timer?.invalidate()
        isTimerRunning = false
    }
    
    func resetTimer() {
        timer?.invalidate()
        startTime = 0
        time = 0
        elapsed = 0
        isTimerRunning = false
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
    
    func startAnimation() {
        let pulseAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
        pulseAnimation.duration = 1
        pulseAnimation.fromValue = 1
        pulseAnimation.toValue = 0.85
        pulseAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        pulseAnimation.autoreverses = true
        pulseAnimation.repeatCount = .greatestFiniteMagnitude
        timerBtn1.layer.add(pulseAnimation, forKey: "animateOpacity")
    }
    
    func stopAnimation() {
        timerBtn1.layer.removeAllAnimations()
    }
    
}
