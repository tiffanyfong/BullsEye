//
//  ViewController.swift
//  BullsEye
//
//  Created by Tiffany Fong on 9/4/16.
//  Copyright © 2016 Tiffany Fong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue: Int = 0
    var targetValue: Int = 0
    var score: Int = 0
    var round: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        updateLabels()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!

    @IBAction func showAlert() {
        let points = 100 - abs(targetValue - currentValue)
        
        let message = "You scored \(points) points!"
        
        score += points
        
        let title: String
        if points == 100 {
            title = "SNIPED!"
        } else if points >= 75 {
            title = "You can do better"
        } else {
            title = "Are you even trying"
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "Next round!", style: .Default,
                                   handler: { action in
                                                self.startNewRound()
                                                self.updateLabels()
                                            })
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func startOver() {
        score = 0
        round = 0
        startNewRound()
        updateLabels()
    }
    
    func startNewRound() {
        sliderMoved(slider)
        targetValue = 1 + Int(arc4random_uniform(100))
        round += 1
    }
    
    func updateLabels() {
        targetLabel.text = "\(targetValue)"
        scoreLabel.text = "\(score)"
        roundLabel.text = "\(round)"
    }
    
    
}

