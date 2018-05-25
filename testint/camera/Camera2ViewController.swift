//
//  Camera2ViewController.swift
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

class Camera2ViewController: UIViewController,UIImagePickerControllerDelegate,
UINavigationControllerDelegate {


    @IBOutlet weak var imageView: UIImageView!
    @IBAction func btnAction(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        
        imagePickerController.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
        
        let actionSheet = UIAlertController(title: "Pick a source", message: "", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action:UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion: nil)
            }else{
                print("Camera niet beschikbaar")
            }
        }))
        
        
        actionSheet.addAction(UIAlertAction(title: "Phote Library", style: .default, handler: {(action:UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
            print("in image picker")
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(actionSheet,animated: true,completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {

    let chosenImage = info[UIImagePickerControllerOriginalImage] as? UIImage!
        print(chosenImage!)
    self.imageView.image = chosenImage
        
        
         dismiss(animated: true, completion: nil)
        let verstuur = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "verstuur") as! verstuurNaarDBViewController
        
        verstuur.newImage = chosenImage
        self.present(verstuur, animated: true,completion: nil)
        }
    
       // uploadFotoToStorage()
    
    
   
    
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        picker.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
                print("foto uploaden")
                storageRef.downloadURL { url, error in
                    if error != nil {
                        // Handle any errors
                    } else {
                        
                        
//                        self.FeedImageUrl =  url!.absoluteString
//
//                        print("imageUrl" , self.FeedImageUrl)
//
//                        self.addPost()
                        
                        
                    }
                }
                //self.FeedImageUrl = metadata?.storageReference.downloadURLWithCompletion()
                
                
                //self.registerUserIntoDatabaseWithUID(uid, values: values as [String : AnyObject])
                
            })
        }
  


     //MARK: - Navigation

     //In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "toBrowsePage" {
//            let dvc = segue.destinationViewController as! verstuurNaarDBViewController
//            dvc.newImage = chosenImage
//    }
//
//}
  }
}
