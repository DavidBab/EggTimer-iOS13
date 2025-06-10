//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var topText: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["Soft": 3, "Medium": 10, "Hard": 20]
    var secondsLeft = 60
    var hardness = ""
    var timer = Timer()
    var progressDecrease: Double = 0.000
    
    @IBAction func eggPressed(_ sender: UIButton) {
        hardness = sender.currentTitle!
        
        topText.text = "You chose \(hardness) hardness."
        progressBar.progress = 1.0
        timer.invalidate()
        
        secondsLeft = eggTimes[hardness]!
        
        switch hardness {
        case "Soft":
            progressDecrease = 1.0/Double(eggTimes[hardness]!)
        case "Medium":
            progressDecrease = 1.0/Double(eggTimes[hardness]!)
        case "Hard":
            progressDecrease = 1.0/Double(eggTimes[hardness]!)
        default:
            progressDecrease = 0
        }
     
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    
    
    @objc func updateTimer() {
        if secondsLeft > 0 {
            print("\(secondsLeft) seconds.")
            secondsLeft -= 1
        
            progressBar.progress -= Float(self.progressDecrease)
        }
        else {
            topText.text = "Done!"
            timer.invalidate()
        }
    }
    
}
