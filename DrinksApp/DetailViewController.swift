//
//  ViewController.swift
//  DrinksApp
//
//  Created by Aleksandr on 18.10.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    var drink: Drink!

    @IBOutlet var drinkImageView: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.shared.fetchImage(from: drink.strDrinkThumb) { imageData in
            self.drinkImageView.image = UIImage(data: imageData)
        }
        descriptionLabel.text = drink.strInstructions
    }

}

