//
//  ViewController.swift
//  Animation_Lab7#1
//
//  Created by iStudents on 4/3/15.
//  Copyright (c) 2015 iStudents. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let coloredSquare = UIView()
    
    //let duration = 1.0
    //let delay = 0.0
    //let options = UIViewAnimationOptions.Repeat
    //let damping = 0.5
    //let velocity = 1.0
    
    
    @IBOutlet weak var numberOfFishSlider: UISlider!
    
    
    @IBAction func animateButtonPressed(sender: AnyObject) {
       
        let numberOfFish = Int(self.numberOfFishSlider.value * 100)
        
        for loopNumber in 0...numberOfFish {
            
            let duration = 1.0
            let options = UIViewAnimationOptions.CurveLinear
            
            let delay = NSTimeInterval(900 + arc4random_uniform(100)) / 1000
            
            let size: CGFloat = CGFloat(arc4random_uniform(40)) + 20
            let yPosition: CGFloat = CGFloat(arc4random_uniform(200)) + 20
            
            let fish = UIImageView()
            fish.image = UIImage(named: "blue-fish")
            fish.frame = CGRectMake(0-size, yPosition, size, size)
            self.view.addSubview(fish)
            
            UIView.animateWithDuration(duration, delay: delay, options: options, animations: {
                fish.frame = CGRectMake(320, yPosition, size, size)
                }, completion: { animationFinished in
                    fish.removeFromSuperview()
            })
            
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

