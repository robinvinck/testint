//
//  testViewController.swift
//  testint
//
//  Created by Robin Vinck on 22/05/18.
//  Copyright © 2018 Robin Vinck. All rights reserved.
//

import UIKit
import Firebase

class testViewController: UIViewController {
    
    var ref: DatabaseReference!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        

        ref.child("personen").child("persoon1").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            let naam = value?["Naam"] as? String ?? ""
            print("testok")
            print(naam)
            
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
