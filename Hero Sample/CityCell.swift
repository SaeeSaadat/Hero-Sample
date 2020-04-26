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
    
    private(set) var city : City?
 
    
    func setCell(city : City , vc: ViewController){
        self.city = city
        if cityImage == nil {return}
        self.cityImage.image = city.image
        label.text = city.name
        let constr = cityImage.heightAnchor.constraint(equalToConstant: 200.0)
        constr.isActive = true
        constr.priority = .init(rawValue: 999)
        self.heightAnchor.constraint(equalTo: cityImage.heightAnchor).isActive = true
        
        self.isHeroEnabled = true
        cityImage.heroID = "cityImage"
        imageView?.heroModifiers = [.zPosition(2)]
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
