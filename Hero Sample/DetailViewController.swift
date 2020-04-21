//
//  DetailViewController.swift
//  Hero Sample
//
//  Created by Saee Saadat on 4/21/20.
//  Copyright © 2020 Saee Saadat. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    
    var unsplashImage : Image?
    
    @IBOutlet weak var textView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textView.layer.cornerRadius = 10.0
        textView.layer.borderWidth = 1.0
        textView.layer.borderColor = UIColor.white.cgColor
        textView.clipsToBounds = true
        
        if let image = unsplashImage {
            imageView.image = image.image
            imageView.heroID = image.id
        }
        
        let swipeGesture = UITapGestureRecognizer()
//        swipeGesture.direction = [.right]
        swipeGesture.addTarget(self, action: #selector(goBack))
        self.view.addGestureRecognizer(swipeGesture)
        self.imageView.addGestureRecognizer(swipeGesture)
    }
    
    
    @objc private func goBack(){
        self.navigationController?.popViewController(animated: true)
    }

}
