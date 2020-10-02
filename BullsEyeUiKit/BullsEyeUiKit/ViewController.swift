//
//  ViewController.swift
//  BullsEyeUiKit
//
//  Created by Alan Soares on 02/10/20.
//

import UIKit

class ViewController: UIViewController {
        
    var currentValue: Int = 0
    var targetValue: Int = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = Int(slider.value.rounded())
        currentValue = roundedValue
        startNewRound()
        
    }
    
    @IBAction func showAlert() {
        let message = "The value of the slider is now: \(currentValue)" +
            "\nThe Target value is: \(targetValue)"
        
        let alert = UIAlertController(title: "\(currentValue)", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundedValue = Int(slider.value.rounded())
        currentValue = roundedValue
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentValue = 1
        slider.value = Float(currentValue)
        upadateLabels()
    }
    
    func upadateLabels( ) {
        targetLabel.text = String(targetValue)
    }
    


}

