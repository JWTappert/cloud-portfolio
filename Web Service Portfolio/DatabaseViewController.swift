//
//  DatabaseViewController.swift
//  Web Service Portfolio
//
//  Created by Justin Tappert on 5/30/17.
//  Copyright © 2017 Justin Tappert. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class DatabaseViewController: UIViewController {
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseApp.configure()
        ref = Database.database().reference()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ref.child("students").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            print(value ?? "test")
            let student = value?["Justin"] as? String ?? "derp"
            print(student)
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    
}
