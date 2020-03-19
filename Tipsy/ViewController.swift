//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var zeroPCTButton: UIButton!
    @IBOutlet weak var tenPCTButton: UIButton!
    @IBOutlet weak var twentyPCTButton: UIButton!
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var splitLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @IBAction func tipSelected(_ sender: UIButton) {
        zeroPCTButton.isSelected = false
        tenPCTButton.isSelected = false
        twentyPCTButton.isSelected = false
        
        if sender.currentTitle == "0%" {
            zeroPCTButton.isSelected = true
        } else if sender.currentTitle == "10%" {
            tenPCTButton.isSelected = true
        } else {
            twentyPCTButton.isSelected = true
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let splitNumber = Int(sender.value).description
        splitLabel.text = splitNumber
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let billAmount = billTextField.text
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
}

