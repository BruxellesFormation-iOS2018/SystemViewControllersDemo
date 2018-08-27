//
//  ViewController.swift
//  SystemViewControllersDemo
//
//  Created by Florian Praile on 27/08/2018.
//  Copyright © 2018 Underside. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var myImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func activityAction(_ sender: Any) {
        guard let image = self.myImageView.image else { return }
        
        let activityVC = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        self.present(activityVC, animated: true, completion: nil)
    }
    
    @IBAction func safariAction(_ sender: Any) {
        let url = URL(string: "https://google.com")!
        let safariVC = SFSafariViewController(url: url)
        self.present(safariVC, animated: true, completion: nil)
    }
    
    @IBAction func alertAction(_ sender: Any) {
        let alertVC = UIAlertController(title: "ykfuygilh ", message: "hgjcjg world", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) 
        
        let confirmAction = UIAlertAction(title: "Action", style: UIAlertActionStyle.default) { (action) in
            print("Callback confirm")
        }
        
        let deleteAction = UIAlertAction(title: "Delete", style: UIAlertActionStyle.destructive) { (action) in
            print("Callback delete")
        }
       
        alertVC.addAction(cancelAction)
        alertVC.addAction(confirmAction)
        alertVC.addAction(deleteAction)
        
        self.present(alertVC, animated: true, completion: nil)
    }
    
    
    @IBAction func cameraAction(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
         self.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else{ return}
       
        self.myImageView.image = image
    }
    
    
}

