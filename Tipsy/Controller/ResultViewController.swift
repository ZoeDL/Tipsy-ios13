//
//  ResultViewController.swift
//  Tipsy
//
//  Created by 余泽熙 on 3/19/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var splitAmount: Double?
    var splitNumber: Int?
    var tipAmount: Double?
    @IBOutlet weak var splitAmountLabel: UILabel!
    @IBOutlet weak var splitInformationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tipPCT = "\(Int((tipAmount ?? 0) * 100))%"
        splitInformationLabel.text = "Split between \(splitNumber ?? 0) people, with \(tipPCT) tip."
        splitAmountLabel.text = String(format: "%.2f", splitAmount ?? 0)
    }
    
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
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
