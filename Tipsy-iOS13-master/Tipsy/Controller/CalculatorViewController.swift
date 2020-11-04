//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPcButton: UIButton!
    @IBOutlet weak var tenPcButton: UIButton!
    @IBOutlet weak var twentyPcButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.10
    var numberLabel = 2
    var billValue:Double = 0.0
    var totalPerPerson = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroPcButton.isSelected = false
        tenPcButton.isSelected = false
        twentyPcButton.isSelected = false
        
        sender.isSelected = true
        
        //Get the current title of the button that was pressed.
        let buttonTitle = sender.currentTitle!
        
        //Remove the last character (%) from the title then turn it back into a String.
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        
        //Turn the String into a Double.
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        
        //Divide the percent expressed out of 100 into a decimal e.g. 10 becomes 0.1
        tip = buttonTitleAsANumber / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        numberLabel = Int(sender.value)
        splitNumberLabel.text = String(
            format: "%.0f", (sender.value))
        
    }
    

    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text!
        print(bill)
//        let bill = "250.50"
        if bill != "" {
            let value = (bill as NSString).doubleValue
//            let value = Double(bill)
            billValue = value
            let valuePerPerson = ((billValue + (billValue * tip)) / Double(numberLabel))
            totalPerPerson = String(format: "%.2f", valuePerPerson)
            self.performSegue(withIdentifier: "goToResult", sender: self)
        }
        print(type(of: bill))
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            let tipPercent = String(format: "%.0f", (tip * 100))
            destinationVC.tipValue = totalPerPerson
            destinationVC.porcentLabel = tipPercent
            destinationVC.totalPeople = String(numberLabel)
        }
    }
    
    
}

