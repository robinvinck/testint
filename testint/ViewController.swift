//
//  ViewController.swift
//  testint
//
//  Created by Robin Vinck on 20/05/18.
//  Copyright © 2018 Robin Vinck. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var name: UITextField!
    
    @IBAction func signin(_ sender: Any) {
        Auth.auth().signIn(withEmail: self.name.text!, password: self.email.text!) { (user, error) in
            if user != nil {
                print("user has signed up")
            }
            
            if error != nil {
                print("failed");
            }
        }
    }
    
    @IBAction func signup(_ sender: Any) {
        Auth.auth().createUser(withEmail: self.name.text!, password: self.email.text!) { (user, error) in
            if user != nil {
                print("user has signed up")
            }
            
            if error != nil {
                print("failed");
            }
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

