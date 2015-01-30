// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class zoodic {
    var name:[Int: String] = [1:"AA", 2:"BB", 3:"CC", 4:"DD"]
    var food:[Int: String] = [1:"aa", 2:"bb", 3:"cc", 4:"dd"]
    
    func check(Name:String){
        var x = 0
        for(var i = 0 ;i <= name.count;i++){
            if(name[i] == Name){
                x = i
            }
        }
        print("\(name[x]) \(food[x])")
    }
}
let C = zoodic()
C.check("BB")