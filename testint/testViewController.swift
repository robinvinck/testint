//
//  testViewController.swift
//  testint
//
//  Created by Robin Vinck on 22/05/18.
//  Copyright © 2018 Robin Vinck. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI
import FirebaseStorage
import FirebaseDatabase
import UserNotifications

//import Mapbox
//import MapboxDirections
//import MapboxCoreNavigation
//import MapboxNavigation


class testViewController: UIViewController {
//    @IBAction func test(_ sender: Any) {
//
//        let content = UNMutableNotificationContent()
    //        content.title = "How many days are there in one year"
//        content.subtitle = "Do you know?"
//        content.body = "Do you really know?"
//        content.badge = 1
//
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
//        let request = UNNotificationRequest(identifier: "timerDone", content: content, trigger: trigger)
//
//        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
//    }
    
    //var ref: DatabaseReference!
   // let directions = Directions.shared
  
    
    // Create a storage reference from our storage service
    
    
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        testImage()
             // ref = Database.database().reference()
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in
        })
        // Get a reference to the storage service using the default Firebase App
        
        
  
        

//        ref.child("personen").child("persoon1").observeSingleEvent(of: .value, with: { (snapshot) in
//            // Get user value
//            let value = snapshot.value as? NSDictionary
//            let naam = value?["Naam"] as? String ?? ""
//            print("testok")
//            print(naam)
//
//            // ...
//        }) { (error) in
//            print(error.localizedDescription)
//        }
        
//        let timeTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 60.0 * 60.0, repeats: false)
//        
//        var date = DateComponents()
//        date.hour = 22
//        let calendarTrigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
//        
//        let content = UNMutableNotificationContent()
//        content.title = "Notification Title"
//        content.subtitle = "Notification Subtitle"
//        content.body = "Some notification body information to be displayed."
//        content.badge = 1
//        content.sound = UNNotificationSound.default()
//        
//        let request = UNNotificationRequest(identifier: "LocalNotification", content: content, trigger: timeTrigger)
//        UNUserNotificationCenter.current().add(request) { error in
//            if let error = error {
//                // Do something with error
//                print("test")
//            } else {
//                // Request was added successfully
//                print("testfailed")
//            }
//        }
        
//        let center = CLLocationCoordinate2D(latitude: 40.0, longitude: 120.0)
//        let region = CLCircularRegion(center: center, radius: 500.0, identifier: "Location")
//        region.notifyOnEntry = true;
//        region.notifyOnExit = false;
//        let locationTrigger = UNLocationNotificationTrigger(region: region, repeats: false)

//        let url = URL(string: "mapbox://styles/mapbox/streets-v10")
//        let mapView = MGLMapView(frame: view.bounds, styleURL: url)
//        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        mapView.setCenter(CLLocationCoordinate2D(latitude: 59.31, longitude: 18.06), zoomLevel: 9, animated: false)
//        view.addSubview(mapView)
        
        
//        let waypoints = [
//            Waypoint(coordinate: CLLocationCoordinate2D(latitude: 38.9131752, longitude: -77.0324047), name: "Mapbox"),
//            Waypoint(coordinate: CLLocationCoordinate2D(latitude: 38.8977, longitude: -77.0365), name: "White House"),
//            ]
//        let options = RouteOptions(waypoints: waypoints, profileIdentifier: .automobileAvoidingTraffic)
//        options.includesSteps = true
//
//        let task = directions.calculate(options) { (waypoints, routes, error) in
//            guard error == nil else {
//                print("Error calculating directions: \(error!)")
//                return
//            }
//
//            if let route = routes?.first, let leg = route.legs.first {
//                print("Route via \(leg):")
//
//                let distanceFormatter = LengthFormatter()
//                let formattedDistance = distanceFormatter.string(fromMeters: route.distance)
//
//                let travelTimeFormatter = DateComponentsFormatter()
//                travelTimeFormatter.unitsStyle = .short
//                let formattedTravelTime = travelTimeFormatter.string(from: route.expectedTravelTime)
//
//                print("Distance: \(formattedDistance); ETA: \(formattedTravelTime!)")
//
//                for step in leg.steps {
//                    print("\(step.instructions)")
//                    let formattedDistance = distanceFormatter.string(fromMeters: step.distance)
//                    print("— \(formattedDistance) —")
//                }
//            }
//        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func testImage(){
        let storage = Storage.storage()
        let storageRef = storage.reference()
        // Reference to an image file in Firebase Storage
        //print(storageRef.bucket)
        let reference = storageRef.child("images/0C7A4138.jpg")
        // Create a reference to the file you want to download
        
        let imageView: UIImageView = self.imageView
        // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
        print(reference)
        reference.getData(maxSize: 1 * 3072 * 3072) { data, error in
            if let error = error {
                // Uh-oh, an error occurred!
                print(error)
                print("doesnt work")
            } else {
                // Data for "images/island.jpg" is returned
                let image = UIImage(data: data!)
                imageView.image = image
            }
        }
        
        
        print(reference)
        
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
