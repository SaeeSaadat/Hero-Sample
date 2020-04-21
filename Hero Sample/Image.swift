//
//  Image.swift
//  Hero Sample
//
//  Created by Saee Saadat on 4/21/20.
//  Copyright © 2020 Saee Saadat. All rights reserved.
//

import Foundation
import UIKit

class Image {
    var id : String
    var image : UIImage
    init(pic: UIImage , id : String){
        self.id = id
        self.image = pic
    }
}
