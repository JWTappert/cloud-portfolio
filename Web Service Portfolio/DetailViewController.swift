//
//  DetailViewController.swift
//  Web Service Portfolio
//
//  Created by Justin Tappert on 6/4/17.
//  Copyright © 2017 Justin Tappert. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var detailViewLabel: UILabel!
    var songArtist: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        detailViewLabel.text = "Details"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        detailViewLabel.text = songArtist
    }
}
