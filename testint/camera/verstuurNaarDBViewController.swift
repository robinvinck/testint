//
//  verstuurNaarDBViewController.swift
//  testint
//
//  Created by Robin Vinck on 24/05/18.
//  Copyright © 2018 Robin Vinck. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI
import FirebaseStorage
import FirebaseDatabase
import UserNotifications

class verstuurNaarDBViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var newImage: UIImage!
    @IBOutlet weak var meeTeSturenText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = newImage
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func verstuurNaarDB(_ sender: Any) {
        
        uploadFotoToStorage()
        
    }
    
    func uploadFotoToStorage(){
        
        let imageName = NSUUID().uuidString
        let storageRef = Storage.storage().reference().child("images").child("\(imageName).png")
        
        if let uploadData = UIImagePNGRepresentation(self.imageView.image!) {
            
            storageRef.putData(uploadData, metadata: nil, completion: { (metadata, error) in
                
                if let error = error {
                    print(error)
                    return
                }
                
                
            })
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */



override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
}
}
