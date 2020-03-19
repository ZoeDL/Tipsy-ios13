//
//  SplitBrain.swift
//  Tipsy
//
//  Created by 余泽熙 on 3/19/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation


struct SplitBrain {
    var split: Split?
    func getTip() -> Double{
        return split?.tip ?? 0.1
    }

    func getSplitNumber() -> Int {
        return split?.splitNumber ?? 2
    }
   
    func getSplitAmount() -> Double {
        return split?.splitAmount ?? 0.0
    }
    
    mutating func calculateSplitAmount(tip: Double, splitNumber: Int, billAmount: Double) {
        let splitAmount = billAmount * (1 + tip) / Double(splitNumber)
        split = Split(tip: tip, splitAmount: splitAmount, splitNumber: splitNumber)
    }
    
    
}
