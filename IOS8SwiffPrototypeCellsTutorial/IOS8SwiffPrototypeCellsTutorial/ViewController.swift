//
//  ViewController.swift
//  IOS8SwiffPrototypeCellsTutorial
//
//  Created by iStudents on 2/13/15.
//  Copyright (c) 2015 iStudents. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    let cellIdentifier = "cellIdentifier"
    var tableData = ["Bus", "Hericopter"]
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Register cell กับ tableview
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: self.cellIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
        //มีการเลือกในtable
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
        //คืนจำนวนข้อมูลที่จะแสดงบนtableview
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        var cell = tableView.dequeueReusableCellWithIdentifier(self.cellIdentifier) as UITableViewCell
        
        cell.textLabel!.text = self.tableData[indexPath.row] //ใส่ค่าชื่อข้อมูลที่จะใส่ในcellในtableview
            var imageName = UIImage(named: tableData[indexPath.row])
            cell.imageView!.image = imageName //ใส่ค่ารูปที่จะใส่ในcell
        
        return cell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        
        let alert = UIAlertController(title: "Item selected", message: "You selected item \(indexPath.row)", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "OK",
            style: UIAlertActionStyle.Default,
            handler: {
                (alert: UIAlertAction!)in println("An alert of type \(alert.style.hashValue)was tapped!")
        }))
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
}

