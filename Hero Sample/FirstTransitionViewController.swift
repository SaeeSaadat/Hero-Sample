//
//  FirstTransitionViewController.swift
//  Hero Sample
//
//  Created by Saee Saadat on 4/24/20.
//  Copyright © 2020 Saee Saadat. All rights reserved.
//

import UIKit

class FirstTransitionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func dismissTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
        
    }
    

}
