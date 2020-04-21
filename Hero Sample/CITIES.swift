//
//  CITIES.swift
//  signup page
//
//  Created by Saee Saadat on 4/6/20.
//  Copyright © 2020 Saee Saadat. All rights reserved.
//

import Foundation
import UIKit

class CITIES {
    private static var cities : [City] = [
    
        City(name: "Mashhad", image: #imageLiteral(resourceName: "Mashhad")) ,
        City(name: "Tehran" , image: #imageLiteral(resourceName: "Tehran")) ,
        City(name: "Isfahan" , image: #imageLiteral(resourceName: "Isfahan")) ,
        City(name : "Kerman" , image: #imageLiteral(resourceName: "Kerman")) ,
        City(name: "Shiraz", image: #imageLiteral(resourceName: "Shiraz")) ,
        City(name: "Hamedan", image: #imageLiteral(resourceName: "Hamedan")) ,
        City(name: "Abadan", image: #imageLiteral(resourceName: "Abadan"))
        
    ]
    
    static func getList() -> [City] {
        return cities
    }
    
}
