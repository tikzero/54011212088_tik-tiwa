// Playground - noun: a place where people can play

import UIKit

class TipCalculatorModel {
    var total:Double
    var taxPct:Double
    var subtotal:Double{
        get{
            return total / (taxPct + 1)
        }
    }
    
    init(total:Double, taxPct:Double){
        self.total = total
        self.taxPct = taxPct
    }
    
    func (){
        
    }
    
    func add() ->Double{
            var sum = input1 + input2
            return sum
    }
    func delete() ->Double{
        var sum = input1 - input2
        return sum
    }
    func multiply() ->Double{
        var sum = input1 * input2
        return sum
    }
    func division() ->Double{
        var sum = input1 / input2
        return sum
    }
}

let c1 = calculator(inP1: 20, inP2: 10,inP3:"")
c1.calculator()

