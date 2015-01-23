// Playground - noun: a place where people can play

import UIKit

var str = "Hello To Zoo"

class animal {
    let animal:[String] = ["วัว","แมว","ช้าง"]
    let food:[String] = ["หญ้า","เนื้อปลา","อ้อย"]
    var temp:String
    
    init(animal:String){
        self.temp = animal
    }
    
    func animalFood()->String{
        var x = ""
        for (var i=0; i<animal.count; i++){
            if(temp == animal[i]){
                x = food[i]
            }
        }
        return x
    }
}

let food = animal(animal: "ช้าง")
food.animalFood()