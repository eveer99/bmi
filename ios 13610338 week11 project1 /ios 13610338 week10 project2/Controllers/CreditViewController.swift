//
//  CreditViewController.swift
//  ios 13610338 week10 project2
//
//  Created by Wnsr on 19/10/2562 BE.
//  Copyright © 2562 Wnsr. All rights reserved.
//

import UIKit

class CreditViewController: UIViewController {
    
    var fullname = "fullname"
    
    @IBOutlet weak var fullnameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fullnameLabel.text = fullname
    }
    
    @IBAction func backPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
