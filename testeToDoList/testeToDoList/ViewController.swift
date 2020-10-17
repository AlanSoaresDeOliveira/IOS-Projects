//
//  ViewController.swift
//  testeToDoList
//
//  Created by Alan Soares on 13/10/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var favoriteDayTextField: UITextField!
    @IBOutlet weak var daySelectedTextField: UILabel!
    
    var daySelected: String?
    
    let days = [
        (value: 0 ,name: "Monday"),
        (value: 1 ,name: "Tuesday"),
        (value: 2 ,name: "Wednesday"),
        (value: 3 ,name: "Thursday"),
        (value: 4 ,name: "Saturday"),
        (value: 5 ,name: "Sunday")
    ]
    
    var selectedDay: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        createDayPicker()
        createToolbar()
        
        // Customizations
    }
    
    func createDayPicker() {
        let dayPicker = UIPickerView()
        dayPicker.delegate = self
        
        favoriteDayTextField.inputView = dayPicker
//        daySelectedTextField = dayPicker
        
        dayPicker.backgroundColor = .black
    }
    
    func createToolbar() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        //Customizations
        toolBar.barTintColor = .black
        toolBar.tintColor = .white
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(ViewController.dismissKeyboard))
        
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        favoriteDayTextField.inputAccessoryView = toolBar
//        daySelectedTextField.inputAccessoryView = toolBar
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
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
        return days[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedDay = days[row].name
        favoriteDayTextField.text = selectedDay
        daySelectedTextField.text = selectedDay
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label: UILabel
        
        if let view = view as? UILabel {
            label = view
        } else {
            label = UILabel()
        }
        
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "Menlo-Regular", size: 17)
        
        label.text = days[row].name
        
        return label
    }
    
    
}

