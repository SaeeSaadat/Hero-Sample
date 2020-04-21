//
//  TableCell.swift
//  signup page
//
//  Created by Saee Saadat on 4/6/20.
//  Copyright © 2020 Saee Saadat. All rights reserved.
//

import UIKit
import Hero

class CityCell: UITableViewCell {

    @IBOutlet weak var cityImage: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    private(set) var unsplashImage : Image? {
        didSet {
            cityImage.image = unsplashImage?.image
            cityImage.heroID = unsplashImage!.id
        }
    }
    
    func setCell(city : City , vc: ViewController){
        if cityImage == nil {return}
        unsplashImage = Image(pic: city.image , id : city.name)
        label.text = city.name
        let constr = cityImage.heightAnchor.constraint(equalToConstant: 200.0)
        constr.isActive = true
        constr.priority = .init(rawValue: 999)
        self.heightAnchor.constraint(equalTo: cityImage.heightAnchor).isActive = true
        
        let tapGesture = UITapGestureRecognizer()
        tapGesture.addTarget(vc , action: #selector(vc.cellTapped(sender:)))
        self.addGestureRecognizer(tapGesture)
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
