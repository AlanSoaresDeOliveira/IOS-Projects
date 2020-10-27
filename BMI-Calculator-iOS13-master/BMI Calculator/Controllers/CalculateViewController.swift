//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    @IBOutlet weak var heightValueLabel: UILabel!
    @IBOutlet weak var weightValueLabel: UILabel!
    
    var bmi: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heightSlider.value = 1.50
        weightSlider.value = 100
    }

    @IBAction func sliderHeightChanged(_ sender: UISlider) {
        let height = Float(String( format: "%.2f", (sender.value)))!
        heightValueLabel.text = "\(height)m"
    }
    
    
    @IBAction func sliderWeightChanged(_ sender: UISlider) {
        let weight = Float(String( format: "%.0f", (sender.value)))!
        weightValueLabel.text = "\(weight)Kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = (heightSlider.value)
        print(height)
        let weight = (weightSlider.value)
        print(weight)

        bmi = weight / pow(height, 2)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = String( format: "%0.1f" ,(bmi))
        }
    }
}

