// Playground - noun: a place where people can play

import UIKit

var airports: [String:String] = ["TYO":"TOKYO" , "DUB":"Dublin"]

if airports.isEmpty{
    println("The airports dictionary is empty,")
}
else{
    println("The airports dictionary is not emety.")
}

println("The airports dictionary contains\(airports.count)items.")


airports["LHR"] = "London"

airports["LHR"] = "London Heathrow"

if let oldValue = airports.updateValue("Dublin International", forKey: "DUB"){
    println("The old value for DUB was\(oldValue).")
}
