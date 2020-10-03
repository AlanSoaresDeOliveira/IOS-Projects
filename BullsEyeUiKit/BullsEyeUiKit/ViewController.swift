//
//  ViewController.swift
//  BullsEyeUiKit
//
//  Created by Alan Soares on 02/10/20.
//

import UIKit

class ViewController: UIViewController {
        
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let roundedValue = Int(slider.value.rounded())
        currentValue = roundedValue
        startNewRound()
        
    }
    
    @IBAction func showAlert() {
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
        score += points
        
        var title: String
        
        if difference == 0 {
            title = "Perfect!"
            points += 100
            score += 100
        } else if difference < 5 {
            title = "You almost hat it!"
            if difference == 1 {
                points += 50
                score += 50
            }
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
                        
        let message = "You scored \(points) points"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        
                        
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundedValue = Int(slider.value.rounded())
        currentValue = roundedValue
    }
    
    @IBAction func startOver() {
        currentValue = 0
        score = 0
        round = 0
        scoreLabel.text = String(0)
        roundLabel.text = String(0)
    }
    
    func startNewRound() {
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 1
        slider.value = Float(currentValue)
        upadateLabels()
    }
    
    func upadateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
        
}

