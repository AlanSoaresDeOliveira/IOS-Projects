//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Alan Soares on 27/10/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var tipValue: String!
    var totalPeople: String!
    var porcentLabel: String!
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(type(of: totalPeople!))
        totalLabel.text = tipValue
        settingsLabel.text = "Dividido por \(String(totalPeople)) pessoas, com \(String(porcentLabel))% de gorjeta."
        
    }
    
    @IBAction func recalculatedPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
