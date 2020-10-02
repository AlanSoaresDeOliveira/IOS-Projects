//
//  ViewController.swift
//  BullsEyeUiKit
//
//  Created by Alan Soares on 02/10/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showAlert() {
        let alert = UIAlertController(title: "Hello World!", message: "This is my first app!", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func knockKnock() {
        let alert = UIAlertController(title: "Knock Knock!", message: "Who's There?", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Little old lady", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }


}

