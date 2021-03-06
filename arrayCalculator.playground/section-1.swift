// Playground - noun: a place where people can play

import UIKit

class  TipCalculatorModel {
    let total:Double
    let taxPct:Double
    let subtotal:Double {
        get {
            return total / (taxPct + 1)
        }
    }
    
    
    init(total:Double,taxPct:Double){
        self.total = total
        self.taxPct = taxPct
    }

    func calcTipWithTipPct(tipPct:Double)->Double{
        return subtotal * tipPct
    }

    func returnPossibleTips() ->[Int:Double]{
        let possibleTipsInferred = [0.15,0.18,0.20]
        let possibleTipsExplicit:[Double] = [0.15,0.18,0.20]
    
        var retval = [Int:Double]()
        for possibleTip in possibleTipsInferred{
            let intPct = Int(possibleTip * 100)
        
            retval[intPct] = calcTipWithTipPct(possibleTip)
        }
        return retval
    }
}

