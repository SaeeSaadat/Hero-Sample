//
//  ViewController.swift
//  Hero Sample
//
//  Created by Saee Saadat on 4/21/20.
//  Copyright © 2020 Saee Saadat. All rights reserved.
//

import UIKit
import Hero

class ViewController: UIViewController {

    private var cities : [City]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cities = CITIES.getList()
        
    }

    
    @objc func cellTapped(sender : UITapGestureRecognizer){
        guard let cell = sender.view as? CityCell else {return}
        let destinationStoryBoard = UIStoryboard(name: "Detail" , bundle: nil)
        if let vc = destinationStoryBoard.instantiateViewController(identifier: "Detail") as? DetailViewController {
            vc.unsplashImage = cell.unsplashImage
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showFirstTransition" {
            let dest = segue.destination as! FirstTransitionViewController
            dest.hero.modalAnimationType = .selectBy(presenting: .pageIn(direction: .right) , dismissing: .zoomSlide(direction: .right))
            
        }else if segue.identifier == "showCity"{
            let dest = segue.destination as! DetailViewController
            let cell = sender as! CityCell
            dest.imageView.image = cell.imageView?.image
            dest.hero.modalAnimationType = .selectBy(presenting: .pageIn(direction: .up), dismissing: .pageOut(direction: .down))
        }
    }

}


extension ViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let city = cities[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CityCell
        cell.setCell(city: city , vc: self)
        return cell
    }
    
    
}
