//
//  ViewController.swift
//  UIKitAnimation
//
//  Created by iStudents on 3/27/15.
//  Copyright (c) 2015 iStudents. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollisionBehaviorDelegate {
    
    var square: UIView! //เครื่องหมาย! เพื่อบอกว่าให้มันเป็นค่าว่างได้(จะได้ไม่มีปัญหาในโค้ด)
    
    //เพิ่มตัวแปรแรงดึงดูด
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    
    //เพิ่มตัวแปรขอบเขตของAnimtion
    var collision: UICollisionBehavior!
    
    //เพิ่มตัวแปรสิ่งกีดขว้าง
    let barrier = UIView(frame: CGRect(x: 0, y: 300, width: 130, height: 10))
    
    var firstContact = false
    
    var snap: UISnapBehavior!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //ใส่สี่เหลี่ยม
        square = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        square.backgroundColor = UIColor.grayColor()
        view.addSubview(square)
        
        //เรียกใช้ตัวแปรแรงดึงดูดใน ViewDidload
        animator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items: [square])
        animator.addBehavior(gravity)
        
        
        //เรียกตั้งค่าและใช้ตัวแปรสิ่งกีดขว้าง
        barrier.backgroundColor = UIColor.redColor()
        view.addSubview(barrier)
        //เรียกใช้ตัวแปรขอบเขต
        
        collision = UICollisionBehavior(items: [square]) //ตั้งให้squareมีคุณลักษณะที่รองรับการชน
        collision.translatesReferenceBoundsIntoBoundary = true  //ตั้งให้มีขอบเขตของการชนอยู่ที่ขอบเขตของView
        collision.addBoundaryWithIdentifier("barrier", forPath: UIBezierPath(rect: barrier.frame)) //ไม่ให้ตัวกีดขว้างเด้ง
        collision.collisionDelegate = self
        animator.addBehavior(collision)
        
        collision.action = {
            println("\(NSStringFromCGAffineTransform(self.square.transform)) \(NSStringFromCGPoint(self.square.center))")
        }
        
        //เพิ่มลักษณะการชน
        let itemBehaviour = UIDynamicItemBehavior(items: [square])
        itemBehaviour.elasticity = 0.6
        animator.addBehavior(itemBehaviour)
        
        
    }
    
    func collisionBehavior(behavior: UICollisionBehavior!, beganContactForItem item: UIDynamicItem!, withBoundaryIdentifier identifier: NSCopying!, atPoint p: CGPoint) {
        println("Boundary contact occurred - \(identifier)")
        
        let collidingView = item as UIView
        collidingView.backgroundColor = UIColor.yellowColor()
        UIView.animateWithDuration(1.0){
            collidingView.backgroundColor = UIColor.grayColor()
        }
        
        if(!firstContact){
            firstContact = true
            
            let square = UIView(frame: CGRect(x: 30, y: 0, width: 100, height: 100))
            square.backgroundColor = UIColor.grayColor()
            view.addSubview(square)
            
            collision.addItem(square)
            gravity.addItem(square)
            
            let attach = UIAttachmentBehavior(item: collidingView, attachedToItem: square)
            animator.addBehavior(attach)
        }
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        if(snap != nil){
            animator.removeBehavior(snap)
        }
        
        let touch = touches.anyObject() as UITouch
        snap = UISnapBehavior(item: square, snapToPoint: touch.locationInView(view))
        //animator = UIDynamicAnimator(referenceView: view)
        //gravity = UIGravityBehavior(items: [snap])
        animator.addBehavior(snap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

