//
//  ViewController.swift
//  testeToDoList
//
//  Created by Alan Soares on 13/10/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var favoriteDayTextField: UITextField!
    
    let days = [
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday",
        "Saturday",
        "Sunday"
    ]
    
    var selectedDay: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        createDayPicker()
        // Do any additional setup after loading the view.
    }
    
    func createDayPicker() {
        let dayPicker = UIPickerView()
        dayPicker.delegate = self
        
        favoriteDayTextField.inputView = dayPicker
    }
    
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return days.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return days[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedDay = days[row]
        favoriteDayTextField.text = selectedDay
    }
    
    
}

