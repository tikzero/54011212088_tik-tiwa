//
//  ViewController.swift
//  Counting
//
//  Created by iStudents on 2/6/15.
//  Copyright (c) 2015 iStudents. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var number1:Int = 0
    var number2:Int = 0
    var number3:Int = 0
    
    
    @IBAction func oneBT(sender: AnyObject) {
        number1 = number1 + 1
        
        label1.text = "\(number1)"
    }
    
    @IBAction func twoBT(sender: AnyObject) {
        number2 = number2 + 1
        
        label2.text = "\(number2)"
    }
    
    @IBAction func threeBT(sender: AnyObject) {
        number3 = number3 + 1
        
        label3.text = "\(number3)"
    }

    @IBAction func resetBT(sender: AnyObject) {
        label1.text = "0"
        label2.text = "0"
        label3.text = "0"
        
        number1 = 0
        number2 = 0
        number3 = 0
    }

}

