//
//  City.swift
//  signup page
//
//  Created by Saee Saadat on 4/6/20.
//  Copyright © 2020 Saee Saadat. All rights reserved.
//

import Foundation
import UIKit

class City {
    private(set) var image : UIImage
    private(set) var name : String
    
    init(name : String , image : UIImage){
        self.image = image
        self.name = name
    }
}
