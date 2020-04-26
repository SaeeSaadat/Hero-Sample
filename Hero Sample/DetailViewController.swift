//
//  DetailViewController.swift
//  Hero Sample
//
//  Created by Saee Saadat on 4/21/20.
//  Copyright © 2020 Saee Saadat. All rights reserved.
//

import UIKit
import Hero

class DetailViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    
    var city : City?
    
    @IBOutlet weak var textView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.isHeroEnabled = true

        textView.layer.cornerRadius = 10.0
        textView.layer.borderWidth = 1.0
        textView.layer.borderColor = UIColor.white.cgColor
        textView.clipsToBounds = true
        
        if let city = city {
            self.imageView.image = city.image
            imageView.hero.id = "cityImage"
            imageView.heroModifiers = [.zPosition(4)]
        }
        
        let panGesture = UIPanGestureRecognizer()
        panGesture.addTarget(self, action: #selector(handlePan(panGR:)))
        imageView.addGestureRecognizer(panGesture)

        
    }

    
    @objc private func handlePan(panGR : UIPanGestureRecognizer){
        
        
        let translation = panGR.translation(in: panGR.view)
        let progress = translation.y / 2 / view.bounds.height
        
        switch panGR.state {
        case .began :
            dismiss(animated: true, completion: nil)
        
        case .changed:
            Hero.shared.update(CGFloat(progress))
            //hero.shared tells hero to jump to a certain point of the transition !
            // the progress parameter is a number between 0 & 1
        
            //this part is for user to be able to drag the view !
            Hero.shared.apply(modifiers: [.position(translation + imageView.center)], to: imageView)
            Hero.shared.apply(modifiers: [.position(translation + textView.center)], to: textView)
            
            
        default :
            
            //to make it cancellable
            if progress + panGR.velocity(in: nil).y / view.bounds.height > 0.3 {
                Hero.shared.finish()
                //if you have used hero.shared.update then you have to call finish ! other wise it'll never end !
            }else {
                Hero.shared.cancel()
            }
        }
    }

}


fileprivate func + (left: CGPoint , right: CGPoint) -> CGPoint {
    //what makes sense :
//    return CGPoint(x: left.x + right.x, y: left.y + right.y)
    
    //what we want to limit the dragging to  only be vertically
    return CGPoint(x:right.x , y: left.y + right.y)
}
