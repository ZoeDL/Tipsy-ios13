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
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var splitLabel: UILabel!
    var splitBrain = SplitBrain()
    
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
        if let billAmountUnwrapped = billAmount {
            if let billAmountDouble = Double(billAmountUnwrapped) {
                let splitNumber = Int(stepper.value)
                var tip: Double = 0
                if(zeroPCTButton.isSelected) {
                    tip = 0
                } else if(tenPCTButton.isSelected) {
                    tip = 0.1
                } else {
                    tip = 0.2
                }
                splitBrain.calculateSplitAmount(tip: tip, splitNumber: splitNumber, billAmount: billAmountDouble)
                self.performSegue(withIdentifier: "goToResultPage", sender: self)
            } else {
                print("invalid bill total")
            }
        }
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResultPage" {
            let distinationVC = segue.destination as! ResultViewController
            distinationVC.splitAmount = splitBrain.getSplitAmount()
            distinationVC.splitNumber = splitBrain.getSplitNumber()
            distinationVC.tipAmount = splitBrain.getTip()
        }
    }
    
}

