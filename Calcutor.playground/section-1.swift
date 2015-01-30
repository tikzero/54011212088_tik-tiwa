// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class calculator {
    let input1:Double
    let input2:Double
    var input3:String
    
    init(inP1:Double,inP2:Double,inP3:String){
        self.input1 = inP1
        self.input2 = inP2
        self.input3 = inP3
        
    }
    
    func calculator(){
        if(input3 == "+"){
            c1.add()
        }
        else if(input3 == "-"){
            c1.delete()
        }
        else if(input3 == "*"){
            c1.multiply()
        }
        else if(input3 == "/"){
            c1.division()
        }
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

let c1 = calculator(inP1: 2, inP2: 6,inP3:"/")
c1.calculator()

