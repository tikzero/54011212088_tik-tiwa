//
//  ViewController.swift
//  UIimagePicker
//
//  Created by iStudents on 4/3/15.
//  Copyright (c) 2015 iStudents. All rights reserved.
//

import UIKit
import MobileCoreServices

class ViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate{

    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func takePhoto(sender: AnyObject) {
        imagePiker.allowsEditing = false
        imagePiker.sourceType = .Camera
        imagePiker.mediaTypes = [kUTTypeImage as NSString]
        presentViewController(imagePiker, animated: true, completion: nil)
        
        newMedia = true
    }
    
    @IBAction func Library(sender: AnyObject) {
        imagePiker.allowsEditing = false
        imagePiker.sourceType = .PhotoLibrary
        imagePiker.mediaTypes = [kUTTypeImage as NSString]
        presentViewController(imagePiker, animated: true, completion: nil)
        
        newMedia = false
    }
    var imagePiker: UIImagePickerController!
    var newMedia: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imagePiker = UIImagePickerController()
        imagePiker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        dismissViewControllerAnimated(true, completion: nil)
        
        let mediaType = info[UIImagePickerControllerMediaType]as NSString
        
        if(mediaType.isEqualToString(kUTTypeImage as NSString)){
            let image = info[UIImagePickerControllerOriginalImage]as UIImage
            imageView.image = image
            
            if(newMedia == true){
                UIImageWriteToSavedPhotosAlbum(image, self, "image: didFinishSaveingWithError: contextInfo", nil)
            }
        }
    }


}

