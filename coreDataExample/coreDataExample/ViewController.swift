//
//  ViewController.swift
//  coreDataExample
//
//  Created by iStudents on 3/20/15.
//  Copyright (c) 2015 iStudents. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController,UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    //var item = [String]()
    var items = [NSManagedObject]()
    
    @IBAction func addItem(sender: AnyObject) {
        
        var alert = UIAlertController(title: "New Note", message: "Add a new item", preferredStyle: .Alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .Default){
            (action: UIAlertAction!) -> Void in
                let textFild = alert.textFields![0] as UITextField
                //self.item.append(textFild.text)
                self.saveName(textFild.text) //กดปุ่มเรียกฟังชั่นsaveNameมา
                self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default){
            (action: UIAlertAction!) -> Void in
        }
        
        alert.addTextFieldWithConfigurationHandler{
            (textField: UITextField!) -> Void in
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
            presentViewController(alert, animated: true, completion: nil)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        
        let fetchRequest = NSFetchRequest(entityName: "Item")
        
        var error: NSError?
        
        let fetchedResults = managedContext.executeFetchRequest(fetchRequest, error: &error) as [NSManagedObject]?
        
        if let results = fetchedResults{
            items = results
        }else {
            println("Could not fetch \(error), \(error!.userInfo)")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        title = "\"Shopping List\""
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func saveName(name: String){
        
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        
        let entity = NSEntityDescription.entityForName("Item", inManagedObjectContext: managedContext)
        let item = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        item.setValue(name, forKey: "name")
        
        var error: NSError?
        if !managedContext.save(&error){
            println("Could not save \(error), \(error?.userInfo)")
        }
        
        items.append(item)
        
        
    }
    
    //MARK: UITableViewDataSource
    func tableView(tableView: UITableView,numberOfRowsInSection section: Int) -> Int{
        return items.count
    }
    
    func tableView(tableView: UITableView,cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        //cell.textLabel!.text = item[indexPath.row]
        
        let item = items[indexPath.row]
        cell.textLabel!.text = item.valueForKey("name") as String?
        
        return cell
    }
    
}

