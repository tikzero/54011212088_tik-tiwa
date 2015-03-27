//
//  ViewController.swift
//  Animation2
//
//  Created by iStudents on 3/27/15.
//  Copyright (c) 2015 iStudents. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //let container = UIView()
    //let redSquare = UIView()
    //let blueSquare = UIView()
    
    let duration = 2.0
    let delay = 0.0
    let options = UIViewKeyframeAnimationOptions.CalculationModeLinear
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //self.container.frame = CGRect(x: 60, y: 60, width: 200, height: 200)
        //self.view.addSubview(container)
        
        
        //self.redSquare.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        //self.blueSquare.frame = redSquare.frame
        
        //self.redSquare.backgroundColor = UIColor.redColor()
        //self.blueSquare.backgroundColor = UIColor.blueColor()
        
        //self.container.addSubview(self.redSquare)
        
        
        //fish.frame = CGRect(x: 55, y: 300, width: 20, height: 20)
        //fish.backgroundColor = UIColor.redColor()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "sea.jpg"))
        
        for i in 0...6{
            let fish = UIImageView()
            
            let fishRandom = Int(arc4random_uniform(3)+1)
            
            fish.image = UIImage(named: "fish_\(fishRandom).png")
            fish.frame = CGRect(x: 50, y: 50, width: 50, height: 50)
            self.view.addSubview(fish)
            
            let fullRotation = CGFloat(M_PI * 2)
            
            self.view.addSubview(fish)
            
            let randomYoffset = CGFloat(arc4random_uniform(150))
        
            let path = UIBezierPath()
            path.moveToPoint(CGPoint(x: 16, y: 239 + randomYoffset))
            path.addCurveToPoint(CGPoint(x: 301, y: 239 + randomYoffset), controlPoint1: CGPoint(x: 136, y: 373 + randomYoffset), controlPoint2: CGPoint(x: 178, y: 110 + randomYoffset))
        
            let anim = CAKeyframeAnimation(keyPath: "position")
            anim.path = path.CGPath
        
            anim.rotationMode = kCAAnimationRotateAuto
            anim.repeatCount = Float.infinity
            anim.duration = Double(arc4random_uniform(40)+30) / 10
            anim.timeOffset = Double(arc4random_uniform(290))
        
            fish.layer.addAnimation(anim, forKey: "animate position along path")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func animateButtonTapped(sender: AnyObject) {
        
        //var views: (frontView: UIView, backView: UIView)
        
        
        //if((self.redSquare.superview) != nil){
            //views = (frontView: self.redSquare, backView: self.blueSquare)
        //}
        //else{
            //views = (frontView: self.blueSquare, backView: self.redSquare)
        //}
        
        //let transitionOptions = UIViewAnimationOptions.TransitionFlipFromLeft
        //UIView.transitionFromView(views.frontView, toView: views.backView, duration: 1.0, options: transitionOptions, completion: nil)
        
    }

    
}

